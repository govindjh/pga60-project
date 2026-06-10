# Delhi-NCR Quick Commerce Delivery Optimization

[![Python](https://img.shields.io/badge/Python-3.9+-blue?logo=python)](https://python.org)
[![Pandas](https://img.shields.io/badge/Pandas-2.0+-150458?logo=pandas)](https://pandas.pydata.org)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

**Reducing SLA breaches in last-mile delivery using data analytics.**

## Overview
This project analyzes 30,000 cleaned quick commerce delivery orders across Delhi-NCR to identify why deliveries are late, which operating conditions create SLA risk, and how the business can improve delivery speed using data-driven decisions.

## Business Problem
Quick commerce companies promise fast delivery. When orders are delayed, customer experience drops and operations become less reliable. This project focuses on reducing `SLA_Breached` orders by studying dark stores, traffic, weather, rider type, delivery distance, and order timing.

## Tools Used
- Python: data cleaning, feature engineering, KPI creation, automated output generation
- SQL: business analysis queries for KPIs, SLA risk, rider performance, and store performance
- Excel: executive workbook with summaries, charts, and formatted analysis sheets
- Power BI: dashboard blueprint, DAX measures, theme, and report-building guide

## Project Workflow

### 1. Business Understanding
Defined the main problem: reduce delivery SLA breaches while protecting revenue and customer experience.

Key business questions:
- Which dark stores have the highest SLA breach rate?
- Does traffic or weather increase late deliveries?
- Do local riders perform better than non-local riders?
- Which hours need more rider capacity?
- Which product categories generate the most revenue?

### 2. Python Analysis & Pipeline
Two entry points:

**`notebooks/Delhi_NCR_Quick_Commerce_Analysis.ipynb`** — interactive Jupyter notebook with full exploratory analysis, cleaning, feature engineering, KPI calculations, and business insights.

**`scripts/build_capstone.py`** — automated pipeline that:
- Loads and cleans raw CSV data
- Removes duplicates and drops irrelevant columns
- Engineers temporal and business features
- Generates an executive Excel workbook with charts and conditional formatting
- Exports clean CSVs for SQL and Power BI
- Creates Power BI reference files (DAX measures, build guide)

Main output: `data/processed/orders_clean.csv`

### 3. SQL Business Analysis
Folder: `sql/`

SQL was used to answer business questions:
- Executive KPIs
- Store performance ranking
- Hourly demand and SLA risk
- Traffic, weather, and vehicle root-cause analysis
- Category revenue analysis
- Distance bucket SLA analysis
- Rider performance
- Local versus non-local rider impact

Main files:
- `sql/01_create_tables.sql`
- `sql/02_business_analysis_queries.sql`

### 4. Excel Reporting
File: `outputs/Delhi_NCR_Quick_Commerce_Capstone_Cleaned.xlsx`

Excel workbook includes:
- Executive Summary
- Store Performance
- Hourly Trend
- Delivery Drivers
- Category Performance
- Local Rider Impact
- SLA Matrix
- Clean Sample
- Power BI Blueprint

### 5. Power BI Dashboard Plan
Folder: `powerbi/`

Power BI deliverables include:
- Dataset to import: `data/processed/orders_clean.csv`
- DAX measures: `powerbi/dax_measures.txt`
- Dashboard guide: `powerbi/powerbi_build_guide.md`
- Theme file: `powerbi/dashboard_theme.json`

Recommended pages:
- Executive Overview
- Store Performance
- Root Cause Analysis
- Demand Planning
- Recommendations

## Key Findings
- Raw orders received: 30,800
- Duplicate orders removed: 800
- Final clean orders analyzed: 30,000
- Total revenue: Rs 54,653,038
- Overall SLA breach rate: 54.46%
- Average delivery time: 12.70 minutes
- DS_Dwarka has the highest SLA breach rate at 55.54%
- Personal_Care is the highest revenue category
- Local riders reduce SLA breach rate by 10.18 percentage points
- Local riders save 1.43 minutes per delivery on average
- Gridlock plus rain is the highest-risk delivery condition

## Final Recommendations
- Assign local riders to high-risk delivery zones, peak hours, bad weather, and long-distance orders.
- Increase rider capacity during peak order hours.
- Prioritize DS_Dwarka for operational improvement.
- Monitor SLA breach rate by store, traffic, weather, vehicle type, and distance bucket.
- Use Power BI for daily operational tracking by city operations teams.

## Setup

```bash
pip install -r requirements.txt
```

## How To Reproduce The Project

### Option 1: Jupyter Notebook (Interactive)
Open `notebooks/Delhi_NCR_Quick_Commerce_Analysis.ipynb` and run cells sequentially.

### Option 2: Automated Pipeline
1. Place the raw CSV file at `data/raw/Delhi_NCR_Delivery_Operations_Raw.csv`.
2. Run the Python pipeline:

```bash
python scripts/build_capstone.py
```

3. Use `data/processed/orders_clean.csv` for SQL and Power BI.
4. Open the Excel report from `outputs/Delhi_NCR_Quick_Commerce_Capstone_Cleaned.xlsx`.
5. Build the Power BI dashboard using the files in `powerbi/`.

## Project Structure

```
.
├── notebooks/
│   ├── Delhi_NCR_Quick_Commerce_Analysis.ipynb   # Main analysis notebook
│   ├── Delhi_NCR_Quick_Commerce_Capstone.ipynb   # Capstone summary notebook
│   └── SQL_Analysis_Step_By_Step.ipynb           # SQL walkthrough
├── scripts/
│   ├── build_capstone.py                         # Automated pipeline
│   └── export_sql_results.py                     # SQL query exporter
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_business_analysis_queries.sql
│   ├── 03_step_by_step_beginner_queries.sql
│   ├── 04_mysql_complete_project_queries.sql
│   └── results/                                  # Query output CSVs
├── data/
│   ├── raw/                                      # Place raw CSV here
│   └── processed/                                # Generated clean data
├── outputs/                                      # Excel reports & JSON
├── powerbi/                                      # Dashboard assets
├── docs/                                         # Documentation
├── presentation/                                 # Slide deck
├── .gitignore
├── .editorconfig
├── requirements.txt
└── README.md
```
