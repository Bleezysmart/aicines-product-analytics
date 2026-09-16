# Power BI Dashboard

The dashboard is the presentation layer of the AICines Product Analytics case study.

## Files

- `AICines_Product_Analytics.pbix` — Power BI source file containing the data model, measures and four-page dashboard.
- `AICines_Product_Analytics_Dashboard.pdf` — exported dashboard covering all four pages.

## Pages

1. **Executive Overview** — platform scale, revenue, creator/content activity, genre performance and acquisition.
2. **Creator Analytics** — creator activity, creator tiers, publications and rewards.
3. **Content & Engagement** — content views, engagement, watch time and interaction activity.
4. **Monetization** — revenue vs paying users, revenue by acquisition source, average transaction value and credit purchasing activity.

## Design

The dashboard follows a dark AICines-inspired visual system with selective purple accents for emphasis and navigation.

The visual system is based on approximate colors observed from the public AICines product/site presentation; these are not presented as official brand guidelines.

## Important data limitation

`fact_content_performance` contains a single 31 August 2026 snapshot. The dashboard therefore uses that table for cross-sectional content comparisons rather than presenting a fabricated January–August views trend. Time-based trends use date-valid event and transaction data.

## Data disclosure

This is a portfolio case study using a controlled synthetic dataset. It is not AICines internal operational data, and the modeled figures must not be interpreted as actual AICines business performance.
