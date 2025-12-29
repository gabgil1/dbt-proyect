WITH source AS (
    SELECT * FROM {{ ref('raw_products') }}
),

renamed AS (
    SELECT
        product_id,
        sku,
        product_name,
        description,
        category_id,
        brand_id,
        supplier_id,
        CAST(price AS DECIMAL(10,2)) AS price,
        CAST(cost AS DECIMAL(10,2)) AS cost,
        CAST(weight_kg AS DECIMAL(10,2)) AS weight_kg,
        is_active,
        CAST(created_at AS DATE) AS created_at,
        CAST(updated_at AS DATE) AS updated_at
    FROM source
)

SELECT * FROM renamed
