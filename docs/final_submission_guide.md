# Final Submission Guide

## Project Title
Delhi-NCR Quick Commerce Delivery Optimization

## Recommended Submission Order

### 1. README
Start with `README.md`. This explains the project objective, tools used, workflow, key findings, and final recommendations.

### 2. Business Report
Open `docs/business_report.md`. This is the written analyst report with business problem, KPIs, insights, and recommendations.

### 3. Python Work
Open `scripts/build_capstone.py`.

Explain that Python was used for:
- Reading the raw CSV
- Cleaning messy fields
- Creating new analysis columns
- Creating summary outputs
- Building Excel and Power BI-ready files

### 4. SQL Work
Open the `sql/` folder.

Show:
- `01_create_tables.sql`
- `02_business_analysis_queries.sql`
- `results/` query output files

Explain that SQL was used to validate and answer the core business questions.

### 5. Excel Work
Open `outputs/Delhi_NCR_Quick_Commerce_Capstone_Cleaned.xlsx`.

Show these tabs in order:
- Executive Summary
- Store Performance
- Hourly Trend
- Delivery Drivers
- Category Performance
- Local Rider Impact
- SLA Matrix
- Power BI Blueprint

### 6. Power BI Work
Open the `powerbi/` folder.

Use:
- `powerbi_build_guide.md` for dashboard page structure
- `dax_measures.txt` for measures
- `dashboard_theme.json` for report theme
- `data/processed/orders_clean.csv` as the Power BI dataset

### 7. Final Presentation
Use `presentation/final_project_presentation.md` to explain the project in interview or viva format.

## Interview Explanation Script
This project solves a delivery operations problem for a quick commerce company in Delhi-NCR. I used Python to clean and transform the raw delivery data, removed 800 duplicate orders, SQL to answer structured business questions, Excel to create an executive reporting workbook, and Power BI planning files to design an interactive dashboard. The most important insight is that local riders perform better than non-local riders, reducing SLA breach rate by 10.18 percentage points and saving 1.43 minutes per delivery. Based on this, I recommend assigning local riders to high-risk zones, peak hours, bad weather, and long-distance deliveries.

## Final Rating Target
This version is structured as a portfolio-ready beginner-to-intermediate capstone project. With an actual Power BI `.pbix` file and dashboard screenshots added manually from Power BI Desktop, it becomes a strong submission-ready project.
