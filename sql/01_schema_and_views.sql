-- AICines Product Analytics
-- SYNTHETIC DATASET: NOT AICines INTERNAL DATA.
-- Public product mechanics were used only to design the analytical model.

CREATE SCHEMA IF NOT EXISTS aicines;
SET search_path TO aicines;

DROP TABLE IF EXISTS fact_creator_rewards, fact_transactions, fact_user_events,
fact_content_performance, dim_content, dim_creators, dim_users, dim_date CASCADE;

CREATE TABLE dim_date (
 date_key INT PRIMARY KEY, date DATE NOT NULL, year INT, month_num INT,
 month VARCHAR(10), month_year VARCHAR(20), week INT, day_name VARCHAR(15), is_weekend BOOLEAN);

CREATE TABLE dim_users (
 user_id INT PRIMARY KEY, signup_date DATE, acquisition_source VARCHAR(50),
 country VARCHAR(50), user_type VARCHAR(20), signup_month VARCHAR(7));

CREATE TABLE dim_creators (
 creator_id INT PRIMARY KEY, user_id INT REFERENCES dim_users(user_id),
 creator_join_date DATE, creator_tier VARCHAR(30), creator_country VARCHAR(50));

CREATE TABLE dim_content (
 content_id INT PRIMARY KEY, creator_id INT REFERENCES dim_creators(creator_id),
 published_date DATE, content_type VARCHAR(30), genre VARCHAR(40),
 ai_model VARCHAR(40), is_remix BOOLEAN);

CREATE TABLE fact_content_performance (
 content_id INT PRIMARY KEY REFERENCES dim_content(content_id),
 snapshot_date DATE, views BIGINT, likes BIGINT, comments BIGINT,
 recreates BIGINT, shares BIGINT, avg_watch_seconds NUMERIC(10,2),
 watch_minutes NUMERIC(14,2));

CREATE TABLE fact_user_events (
 event_id BIGINT PRIMARY KEY, user_id INT REFERENCES dim_users(user_id),
 event_date DATE, event_type VARCHAR(30), content_id INT NULL REFERENCES dim_content(content_id));

CREATE TABLE fact_transactions (
 transaction_id BIGINT PRIMARY KEY, user_id INT REFERENCES dim_users(user_id),
 transaction_date DATE, package VARCHAR(30), amount_usd NUMERIC(12,2), credits_purchased INT);

CREATE TABLE fact_creator_rewards (
 reward_id BIGINT PRIMARY KEY, creator_id INT REFERENCES dim_creators(creator_id),
 content_id INT REFERENCES dim_content(content_id), reward_date DATE,
 reward_type VARCHAR(30), credits_earned INT);

CREATE INDEX idx_events_user_date ON fact_user_events(user_id, event_date);
CREATE INDEX idx_events_type ON fact_user_events(event_type);
CREATE INDEX idx_content_creator ON dim_content(creator_id);
CREATE INDEX idx_content_date ON dim_content(published_date);
CREATE INDEX idx_transactions_date ON fact_transactions(transaction_date);
CREATE INDEX idx_rewards_creator ON fact_creator_rewards(creator_id);

CREATE OR REPLACE VIEW v_content_metrics AS
SELECT c.content_id, c.creator_id, c.published_date, c.content_type, c.genre, c.ai_model,
       p.views, p.likes, p.comments, p.recreates, p.shares, p.watch_minutes,
       ROUND(((p.likes+p.comments+p.recreates+p.shares)::numeric / NULLIF(p.views,0))*100,2)
       AS engagement_rate_pct
FROM dim_content c JOIN fact_content_performance p USING(content_id);

CREATE OR REPLACE VIEW v_creator_performance AS
SELECT c.creator_id, c.creator_tier,
       COUNT(DISTINCT dc.content_id) AS content_published,
       COALESCE(SUM(p.views),0) AS total_views,
       COALESCE(SUM(p.likes),0) AS total_likes,
       COALESCE(SUM(p.comments),0) AS total_comments,
       COALESCE(SUM(p.recreates),0) AS total_recreates,
       COALESCE(SUM(p.shares),0) AS total_shares,
       ROUND(((SUM(p.likes)+SUM(p.comments)+SUM(p.recreates)+SUM(p.shares))::numeric
       / NULLIF(SUM(p.views),0))*100,2) AS engagement_rate_pct
FROM dim_creators c
LEFT JOIN dim_content dc ON c.creator_id=dc.creator_id
LEFT JOIN fact_content_performance p ON dc.content_id=p.content_id
GROUP BY c.creator_id,c.creator_tier;
