# Final Project Presentation

## Slide 1: Project Title
Delhi-NCR Quick Commerce Delivery Optimization

Tools used: Python, SQL, Excel, Power BI

## Slide 2: Business Problem
The company wants to reduce late deliveries across Delhi-NCR. Late orders hurt customer experience and make operations less reliable.

Main target metric: `SLA_Breached`

## Slide 3: Dataset Overview
- Raw rows: 30,800
- Final clean rows: 30,000
- Duplicate orders removed: 800
- Columns: 22 raw columns
- Business area: quick commerce delivery operations
- Main dimensions: store, rider, traffic, weather, vehicle, category, time, distance

## Slide 4: Python Work
Python was used to clean and prepare the data.

Key tasks:
- Converted timestamp fields
- Cleaned rider ratings
- Created delivery speed and revenue per km
- Created distance and delivery time buckets
- Generated clean CSV and Excel outputs

## Slide 5: SQL Work
SQL was used to answer business questions.

Main analyses:
- Executive KPIs
- Store performance
- Hourly demand
- Traffic and weather root cause
- Category revenue
- Rider performance
- Local rider impact

## Slide 6: Excel Work
Excel was used to create an executive workbook.

Workbook tabs:
- Executive Summary
- Store Performance
- Hourly Trend
- Delivery Drivers
- Category Performance
- Local Rider Impact
- SLA Matrix
- Power BI Blueprint

## Slide 7: Power BI Work
Power BI dashboard design includes:
- KPI cards
- Store slicer
- Traffic and weather filters
- Revenue by category
- SLA breach trend
- Demand planning visuals

## Slide 8: Key KPIs
- Total clean orders: 30,000
- Total revenue: Rs 54,653,038
- Average order value: Rs 1,822
- Average delivery time: 12.70 minutes
- SLA breach rate: 54.46%

## Slide 9: Local Rider Impact
Local riders perform better than non-local riders.

- Local rider SLA breach rate: 47.83%
- Non-local rider SLA breach rate: 58.01%
- SLA improvement: 10.18 percentage points
- Time saving: 1.43 minutes per order

## Slide 10: Key Findings
- DS_Dwarka has the highest SLA breach rate.
- Gridlock plus rain creates the highest delivery risk.
- Peak demand occurs around late night and evening hours.
- Personal_Care is the highest revenue category.
- Local riders improve delivery performance.

## Slide 11: Recommendations
- Assign local riders to high-risk zones.
- Increase rider capacity during peak hours.
- Improve DS_Dwarka packing and rider assignment process.
- Monitor SLA daily by store, traffic, weather, and distance.
- Use Power BI for operations tracking.

## Slide 12: Business Impact
Using local riders and better rider allocation can reduce late deliveries, improve customer experience, and help operations teams manage peak-hour demand more effectively.
