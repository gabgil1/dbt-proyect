WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),

enriched AS (
    SELECT
        o.order_id,
        o.order_number,
        o.order_date,
        o.status,
        o.subtotal,
        o.discount_percent,
        o.shipping_cost,
        o.tax_amount,
        o.total_amount,
        o.payment_method,
        o.shipping_method,
        o.promotion_id,
        o.notes,
        
        -- Customer info
        c.customer_id,
        c.customer_name,
        c.customer_email,
        c.customer_city,
        
        -- Calculated fields
        DATE_TRUNC('month', o.order_date) AS order_month,
        CASE 
            WHEN o.total_amount > 1000 THEN 'High Value'
            WHEN o.total_amount > 500 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS order_tier
        
    FROM orders o
    LEFT JOIN customers c ON o.customer_id = c.customer_id
)

SELECT * FROM enriched
