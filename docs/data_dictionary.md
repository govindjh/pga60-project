# Data Dictionary

| Column | Meaning | Usage |
|---|---|---|
| `Order_ID` | Unique order identifier | Order count and primary key |
| `Customer_ID` | Customer identifier | Customer-level reference |
| `Rider_ID` | Delivery rider identifier | Rider performance analysis |
| `Dark_Store_ID` | Fulfillment store | Store performance and SLA analysis |
| `Order_Timestamp` | Order date and time | Time-based analysis |
| `Weather` | Weather condition | Delivery risk analysis |
| `Traffic_Density` | Traffic condition | SLA root-cause analysis |
| `Vehicle_Type` | Rider vehicle type | Vehicle performance analysis |
| `Primary_Category` | Product category | Revenue and category analysis |
| `Payment_Method` | Payment type | Optional customer behavior analysis |
| `Total_Items` | Number of items in order | Order complexity analysis |
| `Delivery_Distance_KM` | Delivery distance | Distance and SLA analysis |
| `Order_Value_INR` | Order value in rupees | Revenue analysis |
| `Is_Local_Rider` | Whether rider is local | Local rider impact analysis |
| `Pack_Time_Mins` | Time to pack order | Store operations analysis |
| `Transit_Time_Mins` | Travel time | Delivery operations analysis |
| `Total_Delivery_Time_Mins` | End-to-end delivery time | Main delivery speed KPI |
| `SLA_Breached` | Late delivery flag | Main target metric |
| `Legacy_Marketing_ID` | Old marketing field | Removed during cleaning because fully missing |
| `Temp_System_Log` | Temporary system log | Removed during cleaning because it is not useful for analysis |
| `Customer_Phone_Raw` | Raw phone field | Removed during cleaning because it contains personal data |
| `Rider_Rating_Raw` | Raw rider rating | Cleaned into `Rider_Rating` |
| `Order_Date` | Derived order date | Power BI and Excel date analysis |
| `Order_Hour` | Derived order hour | Demand planning |
| `Day_Name` | Derived weekday | Demand planning |
| `Week` | Derived week number | Weekly tracking |
| `Rider_Rating` | Cleaned numeric rating | Rider quality analysis |
| `Delivery_Speed_KMPH` | Derived delivery speed | Rider and route performance |
| `Revenue_Per_KM` | Revenue divided by distance | Unit economics analysis |
| `Delivery_Bucket` | Delivery time group | SLA segmentation |
| `Distance_Bucket` | Distance group | Distance risk analysis |
