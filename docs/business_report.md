# Delhi-NCR Quick Commerce Optimization Capstone Report

## Executive Summary
This capstone analyzes 30,000 cleaned quick commerce delivery orders across Delhi-NCR to identify operational drivers of late deliveries and revenue performance. The project uses Python for cleaning and analysis, SQL for business querying, Excel for executive reporting, and Power BI-ready outputs for dashboard development.

## Problem Statement
Quick commerce depends on tight delivery promises. The business needs to understand where SLA breaches occur, which operating conditions create risk, and how dark store teams can improve delivery reliability without losing revenue momentum.

## Key KPIs
- Raw orders received: 30,800
- Duplicate orders removed: 800
- Final clean orders analyzed: 30,000
- Total revenue: Rs 54,653,038
- Average order value: Rs 1,822
- Average delivery time: 12.70 minutes
- SLA breach rate: 54.46%
- Average rider rating: 3.07 / 5
- Local rider SLA breach rate: 47.83%
- Non-local rider SLA breach rate: 58.01%
- Local rider delivery time saving: 1.43 minutes per order

## Important Findings
- DS_Dwarka has the highest SLA breach rate at 55.54%, making it the first store for operational deep dive.
- DS_Noida_Sec18 produces the highest revenue among stores, so performance improvements there can protect the largest revenue base.
- Gridlock plus rain is the most severe delivery risk pattern, with breach rates near or at 100% across vehicle types.
- Local riders perform better than non-local riders, reducing SLA breach rate by 10.18 percentage points and average delivery time by 1.43 minutes.
- Peak order volume occurs around 02:00, followed closely by 04:00, 20:00, and 22:00.
- Personal_Care is the highest revenue category and should be monitored for stockout and fulfillment delays.

## Recommended Actions
- Create a high-risk dispatch rule for gridlock, rain, fog, and long-distance orders.
- Assign local riders to high-risk zones and peak-hour orders because local route knowledge improves SLA performance.
- Add flexible rider capacity for peak hours and evening demand spikes.
- Review DS_Dwarka packing, staging, rider assignment, and local route constraints.
- Track SLA breach rate daily by store, traffic density, distance bucket, and vehicle type.
- Use customer/rider feedback to improve rider training and exception handling.

## Deliverables
- Python pipeline: `scripts/build_capstone.py`
- SQL schema and queries: `sql/`
- Cleaned dataset: `data/processed/orders_clean.csv`
- Excel workbook: `outputs/Delhi_NCR_Quick_Commerce_Capstone_Cleaned.xlsx`
- Power BI guide: `powerbi/powerbi_build_guide.md`
- DAX measures: `powerbi/dax_measures.txt`
