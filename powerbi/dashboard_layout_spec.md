# Power BI Dashboard Layout Specification

## Page 1: Executive Overview

### Purpose
Give leadership a quick view of business performance.

### Visuals
- Card: `Orders`
- Card: `Revenue`
- Card: `Average Order Value`
- Card: `SLA Breach Rate`
- Card: `Average Delivery Time`
- Bar chart: Revenue by `Primary_Category`
- Line chart: Orders by `Order_Hour`
- Slicer: `Dark_Store_ID`
- Slicer: `Weather`
- Slicer: `Traffic_Density`

## Page 2: Store Performance

### Purpose
Identify which dark stores need operational improvement.

### Visuals
- Bar chart: `SLA Breach Rate` by `Dark_Store_ID`
- Bar chart: `Average Delivery Time` by `Dark_Store_ID`
- Table: store, orders, revenue, SLA breach rate, average delivery time
- Slicer: `Primary_Category`
- Slicer: `Vehicle_Type`

## Page 3: Root Cause Analysis

### Purpose
Understand why deliveries are late.

### Visuals
- Matrix: `Traffic_Density` by `Distance_Bucket`, value `SLA Breach Rate`
- Bar chart: `SLA Breach Rate` by `Weather`
- Bar chart: `SLA Breach Rate` by `Vehicle_Type`
- Scatter chart: `Delivery_Distance_KM` vs `Total_Delivery_Time_Mins`

## Page 4: Local Rider Impact

### Purpose
Show whether local riders help solve the SLA breach problem.

### Visuals
- Bar chart: `SLA Breach Rate` by `Is_Local_Rider`
- Bar chart: `Average Delivery Time` by `Is_Local_Rider`
- Card: local rider SLA improvement percentage points
- Card: local rider average time saving
- Table: local vs non-local rider KPIs

## Page 5: Demand Planning

### Purpose
Help operations plan staffing and rider allocation.

### Visuals
- Line chart: Orders by `Order_Hour`
- Bar chart: Orders by `Day_Name`
- Heatmap/matrix: `Order_Hour` vs `Day_Name`, value `Orders`
- Slicer: `Dark_Store_ID`
- Slicer: `Traffic_Density`

## Page 6: Recommendations

### Purpose
Translate analysis into business action.

### Content
- Assign local riders to high-risk zones.
- Add flexible rider capacity during peak hours.
- Prioritize DS_Dwarka for operational review.
- Monitor gridlock and rain conditions closely.
- Track daily SLA breach rate in Power BI.
