from __future__ import annotations

import sqlite3
from pathlib import Path

import pandas as pd


PROJECT_ROOT = Path(__file__).resolve().parents[1]
DATA_PATH = PROJECT_ROOT / "data" / "processed" / "orders_clean.csv"
RESULTS_DIR = PROJECT_ROOT / "sql" / "results"


QUERIES = {
    "01_executive_kpis": """
        SELECT
            COUNT(*) AS total_orders,
            ROUND(SUM(order_value_inr), 2) AS total_revenue_inr,
            ROUND(AVG(order_value_inr), 2) AS avg_order_value_inr,
            ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
            ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct,
            ROUND(AVG(rider_rating), 2) AS avg_rider_rating
        FROM orders_clean
    """,
    "02_store_performance": """
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
        ORDER BY sla_breach_rate_pct DESC
    """,
    "03_hourly_demand": """
        SELECT
            order_hour,
            COUNT(*) AS orders,
            ROUND(SUM(order_value_inr), 2) AS revenue_inr,
            ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
            ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct
        FROM orders_clean
        GROUP BY order_hour
        ORDER BY orders DESC
    """,
    "04_delivery_root_cause": """
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
        ORDER BY sla_breach_rate_pct DESC, orders DESC
    """,
    "05_category_revenue": """
        SELECT
            primary_category,
            COUNT(*) AS orders,
            ROUND(SUM(order_value_inr), 2) AS revenue_inr,
            ROUND(AVG(order_value_inr), 2) AS avg_order_value_inr,
            ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct
        FROM orders_clean
        GROUP BY primary_category
        ORDER BY revenue_inr DESC
    """,
    "06_distance_sla": """
        SELECT
            distance_bucket,
            COUNT(*) AS orders,
            ROUND(AVG(delivery_distance_km), 2) AS avg_distance_km,
            ROUND(AVG(total_delivery_time_mins), 2) AS avg_delivery_time_mins,
            ROUND(AVG(sla_breached) * 100, 2) AS sla_breach_rate_pct
        FROM orders_clean
        GROUP BY distance_bucket
        ORDER BY avg_distance_km
    """,
    "07_rider_performance": """
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
        ORDER BY sla_breach_rate_pct DESC, orders DESC
    """,
    "08_local_rider_impact": """
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
        ORDER BY is_local_rider DESC
    """,
}


def main() -> None:
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    orders = pd.read_csv(DATA_PATH)
    with sqlite3.connect(":memory:") as conn:
        orders.to_sql("orders_clean", conn, index=False, if_exists="replace")
        for name, query in QUERIES.items():
            result = pd.read_sql_query(query, conn)
            result.to_csv(RESULTS_DIR / f"{name}.csv", index=False)
    print(f"SQL result files written to: {RESULTS_DIR}")


if __name__ == "__main__":
    main()
