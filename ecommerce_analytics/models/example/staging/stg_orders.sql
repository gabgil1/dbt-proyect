WITH source AS (
    SELECT * FROM {{ ref('raw_orders') }}
),

renamed AS (
    SELECT
        order_id,
        order_number,
        customer_id,
        CAST(order_date AS DATE) AS order_date,
        status,
        CAST(subtotal AS DECIMAL(10,2)) AS subtotal,
        CAST(discount_percent AS DECIMAL(10,2)) AS discount_percent,
        CAST(shipping_cost AS DECIMAL(10,2)) AS shipping_cost,
        CAST(tax_amount AS DECIMAL(10,2)) AS tax_amount,
        CAST(total_amount AS DECIMAL(10,2)) AS total_amount,
        payment_method,
        shipping_method,
        promotion_id,
        notes
    FROM source
)

SELECT * FROM renamed
