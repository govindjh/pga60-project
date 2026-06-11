-- 1. Executive KPIs
SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(order_value_inr), 2) AS total_revenue_inr,
    ROUND(AVG(order_value_inr), 2) AS avg_order_value_inr,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(rider_rating), 2) AS avg_rider_rating
FROM orders_clean;

-- 2. Store performance ranking
SELECT
    dark_store_id,
    COUNT(*) AS orders,
    ROUND(SUM(order_value_inr), 2) AS revenue_inr,
    ROUND(AVG(order_value_inr), 2) AS avg_order_value_inr,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(delivery_distance_km), 2) AS avg_distance_km,
    ROUND(AVG(rider_rating), 2) AS avg_rider_rating
FROM orders_clean
GROUP BY dark_store_id
ORDER BY sla_breach_rate_pct DESC;

-- 3. Hourly demand and SLA risk
SELECT
    order_hour,
    COUNT(*) AS orders,
    ROUND(SUM(order_value_inr), 2) AS revenue_inr,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY order_hour
ORDER BY orders DESC;

-- 4. Root-cause view by traffic, weather, and vehicle
SELECT
    traffic_density,
    weather,
    vehicle_type,
    COUNT(*) AS orders,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(rider_rating), 2) AS avg_rider_rating
FROM orders_clean
GROUP BY traffic_density, weather, vehicle_type
HAVING COUNT(*) >= 25
ORDER BY sla_breach_rate_pct DESC, orders DESC;

-- 5. Revenue contribution by category
SELECT
    primary_category,
    COUNT(*) AS orders,
    ROUND(SUM(order_value_inr), 2) AS revenue_inr,
    ROUND(AVG(order_value_inr), 2) AS avg_order_value_inr,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY primary_category
ORDER BY revenue_inr DESC;

-- 6. Distance bucket SLA analysis
SELECT
    distance_bucket,
    COUNT(*) AS orders,
    ROUND(AVG(delivery_distance_km), 2) AS avg_distance_km,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct
FROM orders_clean
GROUP BY distance_bucket
ORDER BY avg_distance_km;

-- 7. Rider performance summary
SELECT
    rider_id,
    COUNT(*) AS orders,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(rider_rating), 2) AS avg_rider_rating,
    ROUND(AVG(delivery_speed_kmph), 2) AS avg_delivery_speed_kmph
FROM orders_clean
GROUP BY rider_id
HAVING COUNT(*) >= 20
ORDER BY sla_breach_rate_pct DESC, orders DESC;

-- 8. Impact of local riders
SELECT
    is_local_rider,
    COUNT(*) AS orders,
    ROUND(SUM(order_value_inr), 2) AS revenue_inr,
    ROUND(AVG(order_value_inr), 2) AS avg_order_value_inr,
    ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
    ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct,
    ROUND(AVG(delivery_distance_km), 2) AS avg_distance_km,
    ROUND(AVG(rider_rating), 2) AS avg_rider_rating
FROM orders_clean
GROUP BY is_local_rider
ORDER BY is_local_rider DESC;
