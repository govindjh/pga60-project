-- Delhi-NCR Quick Commerce Capstone
-- Step-by-step SQL queries for beginners
--
-- Table used: orders_clean
-- Main target column: sla_breached
-- 1 = late delivery, 0 = on-time delivery

-- Step 1: View sample records
SELECT *
FROM orders_clean
LIMIT 10;

-- Step 2: Count total rows
SELECT COUNT(*) AS total_orders
FROM orders_clean;

-- Step 3: Executive KPIs
SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(order_value_inr), 2) AS total_revenue_inr,
    ROUND(AVG(order_value_inr), 2) AS avg_order_value_inr,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(rider_rating), 2) AS avg_rider_rating
FROM orders_clean;

-- Step 4: Store performance
SELECT
    dark_store_id,
    COUNT(*) AS orders,
    ROUND(SUM(order_value_inr), 2) AS revenue_inr,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY dark_store_id
ORDER BY sla_breach_rate_pct DESC;

-- Step 5: Hourly demand
SELECT
    order_hour,
    COUNT(*) AS orders,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY order_hour
ORDER BY orders DESC;

-- Step 6: Category revenue
SELECT
    primary_category,
    COUNT(*) AS orders,
    ROUND(SUM(order_value_inr), 2) AS revenue_inr,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY primary_category
ORDER BY revenue_inr DESC;

-- Step 7: Traffic and weather impact
SELECT
    traffic_density,
    weather,
    COUNT(*) AS orders,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY traffic_density, weather
ORDER BY sla_breach_rate_pct DESC;

-- Step 8: Vehicle type performance
SELECT
    vehicle_type,
    COUNT(*) AS orders,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY vehicle_type
ORDER BY sla_breach_rate_pct DESC;

-- Step 9: Distance bucket SLA analysis
SELECT
    distance_bucket,
    COUNT(*) AS orders,
    ROUND(AVG(delivery_distance_km), 2) AS avg_distance_km,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY distance_bucket
ORDER BY avg_distance_km;

-- Step 10: Local rider impact
SELECT
    is_local_rider,
    COUNT(*) AS orders,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(rider_rating), 2) AS avg_rider_rating
FROM orders_clean
GROUP BY is_local_rider
ORDER BY is_local_rider DESC;

-- Step 11: Local rider improvement calculation
WITH rider_type AS (
    SELECT
        is_local_rider,
        AVG(sla_breached) * 100 AS sla_breach_rate_pct,
        AVG(total_delivery_time_mins) AS avg_delivery_time_mins
    FROM orders_clean
    GROUP BY is_local_rider
)
SELECT
    ROUND(non_local.sla_breach_rate_pct - local.sla_breach_rate_pct, 2) AS sla_improvement_percentage_points,
    ROUND(non_local.avg_delivery_time_mins - local.avg_delivery_time_mins, 2) AS time_saving_minutes
FROM rider_type local
JOIN rider_type non_local
WHERE local.is_local_rider = 'Yes'
  AND non_local.is_local_rider = 'No';

-- Step 12: Rider performance
SELECT
    rider_id,
    COUNT(*) AS orders,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(rider_rating), 2) AS avg_rider_rating
FROM orders_clean
GROUP BY rider_id
HAVING COUNT(*) >= 20
ORDER BY sla_breach_rate_pct DESC, orders DESC;
