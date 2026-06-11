# Delhi-NCR Quick Commerce Capstone: Step-by-Step Learning Guide

## Step 1: Understand the Business Problem

### Project Title
Delhi-NCR Quick Commerce Delivery Optimization

### Business Situation
A quick commerce company delivers grocery, snacks, dairy, personal care, and other products across Delhi-NCR. The company promises fast delivery, but many orders are late.

### What Is An SLA Breach?
SLA means Service Level Agreement. In this project, `SLA_Breached = 1` means the delivery was late, and `SLA_Breached = 0` means the delivery was on time.

### Your Role As A Data Analyst
Your job is to analyze delivery data and answer:
- Which dark stores have the highest late delivery rate?
- Which traffic and weather conditions cause delays?
- Which hours have the highest order demand?
- Which product categories generate the most revenue?
- Which rider and vehicle patterns affect delivery performance?
- Do local riders perform better than non-local riders?
- What actions should the operations team take?

## Step 2: Understand The Raw Dataset

### Source File
`C:\Users\caros\Downloads\Delhi_NCR_Delivery_Operations_Raw.csv`

### Dataset Size
- Raw rows: 30,800
- Final clean rows after duplicate removal: 30,000
- Columns: 22

### Important Columns
- `Order_ID`: unique order number
- `Customer_ID`: customer identifier
- `Rider_ID`: delivery partner identifier
- `Dark_Store_ID`: store or fulfillment location
- `Order_Timestamp`: date and time of order
- `Weather`: delivery weather condition
- `Traffic_Density`: traffic level during delivery
- `Vehicle_Type`: rider vehicle type
- `Primary_Category`: product category
- `Payment_Method`: payment type
- `Total_Items`: number of items in order
- `Delivery_Distance_KM`: delivery distance
- `Order_Value_INR`: order value in rupees
- `Pack_Time_Mins`: time taken to pack order
- `Transit_Time_Mins`: travel time
- `Total_Delivery_Time_Mins`: complete delivery time
- `SLA_Breached`: late delivery flag
- `Rider_Rating_Raw`: messy rider rating field
- `Is_Local_Rider`: whether the rider knows the local delivery area

### Data Quality Observations
- `Legacy_Marketing_ID` is fully missing, so it is not useful for analysis.
- `Customer_Phone_Raw` has missing values and should not be used in dashboard analysis.
- `Rider_Rating_Raw` has mixed formats such as `Terrible`, `4.5 stars`, and `2.0`, so it needs cleaning.
- `Order_Timestamp` should be converted into date, hour, day, and week fields.

## Step 3: Clean Data With Python

Main tasks:
- Load the CSV with pandas.
- Remove duplicate orders based on `Order_ID`.
- Drop unwanted/privacy-sensitive columns such as `Legacy_Marketing_ID`, `Temp_System_Log`, and `Customer_Phone_Raw`.
- Convert `Order_Timestamp` into datetime.
- Create `Order_Date`, `Order_Hour`, `Day_Name`, and `Week`.
- Convert `Rider_Rating_Raw` into numeric `Rider_Rating`.
- Create delivery performance fields like `Delivery_Speed_KMPH`.
- Create buckets like `Distance_Bucket` and `Delivery_Bucket`.
- Save a clean file for SQL, Excel, and Power BI.

Python file:
`scripts/build_capstone.py`

Clean output:
`data/processed/orders_clean.csv`

## Step 4: Analyze With SQL

Use SQL to answer business questions:
- Total orders, revenue, average delivery time, SLA breach rate
- Store-level performance
- Hourly demand
- Traffic and weather impact
- Category revenue
- Rider performance
- Local versus non-local rider impact

SQL files:
- `sql/01_create_tables.sql`
- `sql/02_business_analysis_queries.sql`

## Step 5: Build Excel Report

Excel is used for:
- Executive summary
- KPI reporting
- Store performance tables
- Hourly trend charts
- SLA risk analysis
- Category revenue analysis

Excel output:
`outputs/Delhi_NCR_Quick_Commerce_Capstone_Cleaned.xlsx`

## Step 6: Build Power BI Dashboard

Power BI is used for an interactive dashboard with:
- KPI cards
- Store slicers
- Traffic and weather filters
- Revenue by category
- SLA breach analysis
- Demand planning visuals

Power BI files:
- `powerbi/powerbi_build_guide.md`
- `powerbi/dax_measures.txt`
- `powerbi/dashboard_theme.json`

## Step 7: Write The Final Story

A strong capstone should end with:
- Business problem
- Tools used
- Data cleaning steps
- Analysis approach
- Key insights
- Recommendations
- Business impact

Report file:
`docs/business_report.md`
