# AICines Product Analytics Case Study

**Prepared by:** Ibraheem Ibraheem  
**Purpose:** Portfolio case study for the AICines Data Analyst application  
**Analysis period:** January 2026 – August 2026  
**Stack:** PostgreSQL • SQL • Power Query • Power BI • DAX

## Overview

This is an end-to-end product analytics case study designed to demonstrate how I would approach product, creator, content, engagement and monetization analytics for an AI-first content platform.

> **Data disclosure:** AICines internal operational data was not publicly available. This project therefore uses a controlled **synthetic dataset** informed by publicly observable AICines product characteristics and common product-analytics structures. It is **not AICines internal data**, and the modeled figures must not be interpreted as actual AICines business performance.

## Business questions

- How are users and creators engaging with the product?
- Which content types and genres generate the most modeled consumption?
- How does creator activity and reward coverage vary by creator tier?
- Is revenue movement associated with changes in paying users?
- Which acquisition sources contribute the most modeled revenue?
- How does average transaction value and credit purchasing activity change over time?

## Dashboard

The Power BI dashboard contains four pages:

1. **Executive Overview** — platform scale, revenue, activity, genre performance and acquisition.
2. **Creator Analytics** — creator activity, tiers, publications and rewards.
3. **Content & Engagement** — content volume, views, engagement, watch time and interaction activity.
4. **Monetization** — revenue, paying users, transaction economics, acquisition revenue and credit purchases.

Dashboard screenshots are included in `dashboard/`.

## Data model

The analytical model contains 8 tables and 399,243 synthetic records across date, user, creator, content, product-event, transaction, reward and content-performance domains.

### Dimensions
- `dim_date`
- `dim_users`
- `dim_creators`
- `dim_content`

### Fact tables
- `fact_user_events`
- `fact_transactions`
- `fact_creator_rewards`
- `fact_content_performance`

## Validation

The workflow included row-count checks, date-range checks, coverage checks, relationship validation and DAX measure testing. The synthetic data was generated under controlled conditions, keeping keys, dates and categories internally consistent; SQL and Power BI validation were then used to confirm the model.

A key limitation was respected: `fact_content_performance` contains a single **31 August 2026 snapshot**, so it was used for cross-sectional content comparisons rather than a fabricated January–August views trend.

## Key modeled outputs

- 15K modeled users
- 10K modeled creators
- 60K modeled content records
- 132.26M modeled views
- 8.43% modeled engagement rate
- 75.8% modeled creator reward coverage
- $1.31M modeled revenue
- 18K modeled transactions
- $72.77 average transaction value
- $124.59 modeled revenue per paying user

## Recommendations

- Strengthen creator activation and retention measurement.
- Analyze content performance using views, engagement and watch time together.
- Compare acquisition channels by both customer volume and revenue contribution.
- Connect credit purchasing with creation and interaction behavior.
- Extend the model with cohorts, funnels, churn, reactivation, experimentation and lifetime-value analysis.

## Repository structure

```text
├── README.md
├── dashboard/
│   ├── dashboard-preview.png
│   ├── aicines_dashboard_page_1.png
│   ├── aicines_dashboard_page_2.png
│   ├── aicines_dashboard_page_3.png
│   └── aicines_dashboard_page_4.png
├── reports/
│   ├── AICines_Product_Analytics_Short_Report.pdf
│   └── AICines_Product_Analytics_Full_Report.pdf
├── data/
│   ├── dim_date.csv
│   ├── dim_users.csv
│   ├── dim_creators.csv
│   ├── dim_content.csv
│   ├── fact_content_performance.csv
│   ├── fact_creator_rewards.csv
│   ├── fact_transactions.csv
│   └── fact_user_events.csv
└── documentation/
    └── data_dictionary.csv
```

## Author

**Ibraheem Ibraheem**  
Data / Financial Analyst | Power BI | SQL | DAX
