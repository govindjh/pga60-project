CREATE DATABASE IF NOT EXISTS quick_commerce_capstone;
USE quick_commerce_capstone;

DROP TABLE IF EXISTS orders_clean;

CREATE TABLE orders_clean (
    Order_ID VARCHAR(50) PRIMARY KEY,
    Customer_ID VARCHAR(50),
    Customer_Phone_Raw VARCHAR(20),
    SLA_Breached INT,
    Total_Delivery_Time_Mins DECIMAL(10,4),
    Transit_Time_Mins DECIMAL(10,4),
    Pack_Time_Mins DECIMAL(10,4),
    Is_Local_Rider VARCHAR(10),
    Order_Value_INR DECIMAL(12,2),
    Delivery_Distance_KM DECIMAL(10,2),
    Total_Items INT,
    Payment_Method VARCHAR(100),
    Primary_Category VARCHAR(100),
    Vehicle_Type VARCHAR(50),
    Traffic_Density VARCHAR(50),
    Weather VARCHAR(50),
    Order_Timestamp DATETIME,
    Dark_Store_ID VARCHAR(100),
    Rider_ID VARCHAR(50),
    Rider_Rating DECIMAL(4,2),
    Order_Date DATE,
    Order_Hour INT,
    Day_Name VARCHAR(20),
    Week INT,
    Delivery_Speed_KMPH DECIMAL(10,4),
    Revenue_Per_KM DECIMAL(12,4),
    Delivery_Bucket VARCHAR(20),
    Distance_Bucket VARCHAR(20)
);

SELECT COUNT(*) AS total_rows FROM orders_clean; 

-- View sample records
SELECT *
FROM orders_clean
LIMIT 10;

-- 1. Executive KPIs
SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(Order_Value_INR), 2) AS total_revenue_inr,
    ROUND(AVG(Order_Value_INR), 2) AS avg_order_value_inr,
    ROUND(AVG(Total_Delivery_Time_Mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(SLA_Breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(Rider_Rating), 2) AS avg_rider_rating
FROM orders_clean;

-- 2. Store performance ranking
SELECT
    Dark_Store_ID,
    COUNT(*) AS orders,
    ROUND(SUM(Order_Value_INR), 2) AS revenue_inr,
    ROUND(AVG(Order_Value_INR), 2) AS avg_order_value_inr,
    ROUND(AVG(Total_Delivery_Time_Mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(SLA_Breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(Delivery_Distance_KM), 2) AS avg_distance_km,
    ROUND(AVG(Rider_Rating), 2) AS avg_rider_rating
FROM orders_clean
GROUP BY Dark_Store_ID
ORDER BY sla_breach_rate_pct DESC;

-- 3. Hourly demand and SLA risk
SELECT
    Order_Hour,
    COUNT(*) AS orders,
    ROUND(SUM(Order_Value_INR), 2) AS revenue_inr,
    ROUND(AVG(Total_Delivery_Time_Mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(SLA_Breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY Order_Hour
ORDER BY orders DESC;

-- 4. Traffic and weather impact
SELECT
    Traffic_Density,
    Weather,
    COUNT(*) AS orders,
    ROUND(AVG(Total_Delivery_Time_Mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(SLA_Breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY Traffic_Density, Weather
ORDER BY sla_breach_rate_pct DESC, orders DESC;

-- 5. Root cause by traffic, weather, and vehicle
SELECT
    Traffic_Density,
    Weather,
    Vehicle_Type,
    COUNT(*) AS orders,
    ROUND(AVG(Total_Delivery_Time_Mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(SLA_Breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(Rider_Rating), 2) AS avg_rider_rating
FROM orders_clean
GROUP BY Traffic_Density, Weather, Vehicle_Type
HAVING COUNT(*) >= 25
ORDER BY sla_breach_rate_pct DESC, orders DESC;

-- 6. Category revenue analysis
SELECT
    Primary_Category,
    COUNT(*) AS orders,
    ROUND(SUM(Order_Value_INR), 2) AS revenue_inr,
    ROUND(AVG(Order_Value_INR), 2) AS avg_order_value_inr,
    ROUND(AVG(SLA_Breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(Total_Delivery_Time_Mins), 2) AS avg_delivery_time_mins
FROM orders_clean
GROUP BY Primary_Category
ORDER BY revenue_inr DESC;

-- 7. Vehicle type performance
SELECT
    Vehicle_Type,
    COUNT(*) AS orders,
    ROUND(AVG(Total_Delivery_Time_Mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(SLA_Breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(Rider_Rating), 2) AS avg_rider_rating
FROM orders_clean
GROUP BY Vehicle_Type
ORDER BY sla_breach_rate_pct DESC;

-- 8. Distance bucket SLA analysis
SELECT
    Distance_Bucket,
    COUNT(*) AS orders,
    ROUND(AVG(Delivery_Distance_KM), 2) AS avg_distance_km,
    ROUND(AVG(Total_Delivery_Time_Mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(SLA_Breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY Distance_Bucket
ORDER BY avg_distance_km;

-- 9. Local rider impact
SELECT
    Is_Local_Rider,
    COUNT(*) AS orders,
    ROUND(SUM(Order_Value_INR), 2) AS revenue_inr,
    ROUND(AVG(Order_Value_INR), 2) AS avg_order_value_inr,
    ROUND(AVG(Total_Delivery_Time_Mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(SLA_Breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(Delivery_Distance_KM), 2) AS avg_distance_km,
    ROUND(AVG(Rider_Rating), 2) AS avg_rider_rating
FROM orders_clean
GROUP BY Is_Local_Rider
ORDER BY Is_Local_Rider DESC;

-- 10. Local rider improvement calculation
WITH rider_type AS (
    SELECT
        Is_Local_Rider,
        AVG(SLA_Breached) * 100 AS sla_breach_rate_pct,
        AVG(Total_Delivery_Time_Mins) AS avg_delivery_time_mins
    FROM orders_clean
    GROUP BY Is_Local_Rider
)
SELECT
    ROUND(non_local.sla_breach_rate_pct - local.sla_breach_rate_pct, 2) AS sla_improvement_percentage_points,
    ROUND(non_local.avg_delivery_time_mins - local.avg_delivery_time_mins, 2) AS time_saving_minutes
FROM rider_type AS local
JOIN rider_type AS non_local
WHERE local.Is_Local_Rider = 'Yes'
  AND non_local.Is_Local_Rider = 'No';

-- 11. Rider performance summary
SELECT
    Rider_ID,
    COUNT(*) AS orders,
    ROUND(AVG(Total_Delivery_Time_Mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(SLA_Breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(Rider_Rating), 2) AS avg_rider_rating,
    ROUND(AVG(Delivery_Speed_KMPH), 2) AS avg_delivery_speed_kmph
FROM orders_clean
GROUP BY Rider_ID
HAVING COUNT(*) >= 20
ORDER BY sla_breach_rate_pct DESC, orders DESC;

-- 12. Payment method analysis
SELECT
    Payment_Method,
    COUNT(*) AS orders,
    ROUND(SUM(Order_Value_INR), 2) AS revenue_inr,
    ROUND(AVG(Order_Value_INR), 2) AS avg_order_value_inr,
    ROUND(AVG(SLA_Breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY Payment_Method
ORDER BY orders DESC;

-- 13. Store and local rider combined impact
SELECT
    Dark_Store_ID,
    Is_Local_Rider,
    COUNT(*) AS orders,
    ROUND(AVG(Total_Delivery_Time_Mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(SLA_Breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY Dark_Store_ID, Is_Local_Rider
ORDER BY Dark_Store_ID, Is_Local_Rider DESC;

-- 14. Final business recommendation evidence
SELECT
    'Use local riders for high-risk orders' AS recommendation,
    ROUND(non_local.sla_breach_rate_pct - local.sla_breach_rate_pct, 2) AS expected_sla_improvement_percentage_points,
    ROUND(non_local.avg_delivery_time_mins - local.avg_delivery_time_mins, 2) AS expected_time_saving_minutes
FROM (
    SELECT
        AVG(SLA_Breached) * 100 AS sla_breach_rate_pct,
        AVG(Total_Delivery_Time_Mins) AS avg_delivery_time_mins
    FROM orders_clean
    WHERE Is_Local_Rider = 'Yes'
) AS local
JOIN (
    SELECT
        AVG(SLA_Breached) * 100 AS sla_breach_rate_pct,
        AVG(Total_Delivery_Time_Mins) AS avg_delivery_time_mins
    FROM orders_clean
    WHERE Is_Local_Rider = 'No'
) AS non_local;
