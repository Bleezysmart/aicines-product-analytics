# Methodology

## 1. Business context

This portfolio case study demonstrates an end-to-end product analytics workflow for an AI-first content platform, covering users, creators, content, engagement and monetization.

## 2. Data approach

AICines internal operational data was not publicly available. The analytical layer therefore uses a controlled synthetic dataset informed by publicly observable AICines product characteristics and common product-analytics structures. The modeled figures are illustrative and must not be interpreted as actual AICines business performance.

## 3. Data architecture

The model separates descriptive dimensions from business-process fact tables:

- `dim_date` — calendar attributes used for time analysis.
- `dim_users` — user attributes and modeled acquisition source.
- `dim_creators` — creator attributes and modeled creator tier.
- `dim_content` — content type and genre attributes.
- `fact_user_events` — product activity and funnel events.
- `fact_transactions` — modeled monetization transactions.
- `fact_creator_rewards` — modeled creator reward activity.
- `fact_content_performance` — content performance snapshot metrics.

## 4. Analytical layers

### Acquisition

Users are analyzed by acquisition source to understand the modeled distribution of the user base and revenue contribution.

### Creator analytics

Creator tier, activity, publication behavior and reward coverage are used to understand the modeled creator ecosystem.

### Content and engagement

Views, likes, comments, recreates, shares, watch time and interaction events are used to compare content performance.

### Monetization

Revenue, paying users, transactions, average transaction value, revenue per paying user and credit purchasing activity are analyzed together.

## 5. Validation

The workflow included:

- Row-count checks across tables.
- Date-range and event-coverage checks.
- Key and relationship validation.
- Aggregation checks for revenue, views and rewards.
- Power BI relationship and filter-path testing.
- DAX measure testing.
- Chronological month sorting.
- Removal of unintended blank analytical categories.

The synthetic dataset was generated under controlled conditions, keeping keys, dates and categories internally consistent. This allowed the analytical model to be tested before dashboard development.

## 6. Important limitation

`fact_content_performance` contains a single **31 August 2026 snapshot**. It is therefore used for cross-sectional comparisons such as content type and genre performance. It is not used to manufacture a January–August content-views trend.

## 7. Dashboard design

The Power BI dashboard uses a dark visual system based on the project design palette:

- Background: `#0B0B0F`
- Card surface: `#121217`
- Primary purple: `#815EF9`
- Primary text: `#F8F9FF`
- Secondary text: `#A7AEC0`
- Border: `#252332`

Purple is used selectively for emphasis, active navigation, key metrics and chart series rather than as the dominant page background.

## 8. Production extension

With production data access, the framework could be extended with user and creator cohorts, activation funnels, retention, churn, reactivation, lifetime value, experimentation, anomaly detection and more granular content-level performance history.
