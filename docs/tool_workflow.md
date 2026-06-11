# Tool-Wise Project Workflow

## Correct Project Order
For a data analyst capstone, the best order is:

1. Business understanding
2. Python cleaning and feature engineering
3. SQL analysis and validation
4. Excel executive reporting
5. Power BI dashboard design
6. Final insights and recommendations

## 1. Python Work

### Purpose
Python was used to prepare the raw dataset for analysis.

### File Used
`scripts/build_capstone.py`

### Steps Performed
1. Imported the raw CSV file.
2. Checked columns and data quality.
3. Removed 800 duplicate orders based on `Order_ID`.
4. Dropped unwanted/privacy-sensitive columns.
5. Converted `Order_Timestamp` into datetime.
6. Created `Order_Date`, `Order_Hour`, `Day_Name`, and `Week`.
7. Cleaned `Rider_Rating_Raw` into numeric `Rider_Rating`.
8. Created `Delivery_Speed_KMPH`.
9. Created `Revenue_Per_KM`.
10. Created `Delivery_Bucket` and `Distance_Bucket`.
11. Created summary tables for store, category, hourly, SLA, and local rider analysis.
12. Exported clean files for SQL, Excel, and Power BI.

### Output Files
- `data/processed/orders_clean.csv`
- `data/processed/store_performance.csv`
- `data/processed/hourly_trend.csv`
- `data/processed/delivery_drivers.csv`
- `data/processed/category_performance.csv`
- `data/processed/local_rider_impact.csv`
- `data/processed/sla_matrix.csv`

## 2. SQL Work

### Purpose
SQL was used to answer structured business questions and validate the Python outputs.

### Files Used
- `sql/01_create_tables.sql`
- `sql/02_business_analysis_queries.sql`
- `scripts/export_sql_results.py`

### Queries Created
1. Executive KPIs
2. Store performance ranking
3. Hourly demand and SLA risk
4. Root cause by traffic, weather, and vehicle
5. Category revenue contribution
6. Distance bucket SLA analysis
7. Rider performance summary
8. Local rider impact

### Output Files
SQL result CSV files are stored in:
`sql/results/`

## 3. Excel Work

### Purpose
Excel was used to create a business-friendly executive report.

### File Used
`outputs/Delhi_NCR_Quick_Commerce_Capstone_Cleaned.xlsx`

### Workbook Tabs
1. `Executive Summary`: project KPIs, business objective, and key insights
2. `Store Performance`: store-wise revenue, delivery time, and SLA rate
3. `Hourly Trend`: demand by hour with chart
4. `Delivery Drivers`: traffic, weather, and vehicle impact
5. `Category Performance`: revenue and SLA by product category
6. `Local Rider Impact`: local vs non-local rider performance
7. `SLA Matrix`: SLA rate by traffic and distance bucket
8. `Clean Sample`: sample of cleaned order-level data
9. `Power BI Blueprint`: dashboard page plan

### Excel Value
Excel gives managers a quick static report they can open without technical tools.

## 4. Power BI Work

### Purpose
Power BI was planned for interactive dashboard reporting.

### Files Used
- `powerbi/powerbi_build_guide.md`
- `powerbi/dax_measures.txt`
- `powerbi/dashboard_theme.json`
- `data/processed/orders_clean.csv`

### Dashboard Pages
1. Executive Overview
2. Store Performance
3. Root Cause Analysis
4. Demand Planning
5. Recommendations

### Recommended Visuals
- KPI cards: Orders, Revenue, AOV, SLA Breach Rate, Average Delivery Time
- Bar chart: SLA breach rate by dark store
- Line chart: Orders by hour
- Matrix: Traffic density vs distance bucket
- Clustered bar chart: Revenue by category
- Donut or bar chart: local vs non-local rider SLA rate
- Slicers: store, weather, traffic, vehicle, category, distance bucket

## 5. Final Business Story

### Main Insight
Local riders perform better than non-local riders.

### Evidence
- Local rider SLA breach rate: 47.83%
- Non-local rider SLA breach rate: 58.01%
- SLA improvement: 10.18 percentage points
- Delivery time saving: 1.43 minutes per order

### Recommendation
Assign local riders to high-risk zones, bad weather, heavy traffic, peak-hour orders, and long-distance deliveries.
