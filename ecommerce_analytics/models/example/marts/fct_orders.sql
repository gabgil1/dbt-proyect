{{
    config(
        materialized='table'
    )
}}

WITH orders AS (
    SELECT * FROM {{ ref('int_orders_enriched') }}
)

SELECT
    order_id,
    order_number,
    order_date,
    order_month,
    customer_id,
    promotion_id,
    subtotal,
    discount_percent,
    shipping_cost,
    tax_amount,
    total_amount,
    payment_method,
    shipping_method,
    order_tier
FROM orders
