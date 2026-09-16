# Dataset

This folder contains the synthetic analytical dataset used for the AICines Product Analytics portfolio case study.

## Tables

- `dim_date.csv`
- `dim_users.csv`
- `dim_creators.csv`
- `dim_content.csv`
- `fact_user_events.csv`
- `fact_transactions.csv`
- `fact_creator_rewards.csv`
- `fact_content_performance.csv`

## Data disclosure

The dataset is synthetic and was created for portfolio demonstration. It is informed by publicly observable AICines product characteristics and common product-analytics structures. It is not AICines internal operational data.

## Coverage

The modeled product activity covers January 2026 through August 2026. The content-performance fact is a **31 August 2026 snapshot**, which is intentionally treated as a snapshot rather than a historical time series.

## Intended use

The data supports demonstration of:

- SQL data preparation and analysis.
- Dimensional modeling.
- Power BI relationships and DAX measures.
- Product engagement analysis.
- Creator analytics.
- Monetization analysis.

A production implementation would require source-system definitions, event instrumentation documentation, data-quality monitoring and validated business KPI definitions.
