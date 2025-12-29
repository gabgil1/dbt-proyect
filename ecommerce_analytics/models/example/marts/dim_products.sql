{{
    config(
        materialized='table'
    )
}}

WITH products AS (
    SELECT DISTINCT
        product_id,
        sku,
        product_name,
        description,
        category_id,
        brand_id,
        supplier_id,
        price,
        cost,
        weight_kg,
        is_active,
        created_at,
        updated_at
    FROM {{ ref('stg_products') }}
)

SELECT * FROM products
