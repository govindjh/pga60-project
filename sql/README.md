# SQL Layer

This folder adds the SQL component of the capstone project.

## Files
- `01_create_tables.sql`: Creates the `orders_clean` table for the cleaned CSV output.
- `02_business_analysis_queries.sql`: Contains business analysis queries for KPIs, SLA risk, store performance, demand planning, rider performance, and revenue analysis.
- The query file also includes local versus non-local rider impact analysis.

## How To Use
1. Run the Python pipeline first: `python scripts/build_capstone.py`
2. Import `data/processed/orders_clean.csv` into a database table named `orders_clean`.
3. Run `sql/02_business_analysis_queries.sql` to reproduce the main analytical outputs.

## Recommended SQL Deliverables
- Executive KPI query
- Store performance ranking
- Hourly demand analysis
- SLA root-cause analysis
- Category revenue analysis
- Rider performance analysis
- Local rider impact analysis
