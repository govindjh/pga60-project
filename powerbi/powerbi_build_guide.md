# Power BI Build Guide

## Load Data
Import `data/processed/orders_clean.csv` into Power BI Desktop.

## Model
Use `Order_Date`, `Order_Hour`, `Dark_Store_ID`, `Weather`, `Traffic_Density`, `Vehicle_Type`, `Primary_Category`, and `Distance_Bucket` as slicer fields.

## Measures
Create the measures listed in `powerbi/dax_measures.txt`.

## Dashboard Pages
- Executive Overview: KPI cards, revenue by category, hourly order trend
- Store Performance: SLA breach rate by dark store, average delivery time, revenue
- Root Cause: SLA rate by traffic, weather, vehicle type, and distance bucket
- Demand Planning: orders by hour and day, peak period staffing recommendation
- Recommendations: operational actions and expected business impact
