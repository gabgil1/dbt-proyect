WITH source AS (
    SELECT * FROM {{ ref('raw_customers') }}
),

renamed AS (
    SELECT
        customer_id,
        first_name || ' ' || last_name AS customer_name,
        email AS customer_email,
        phone,
        CAST(birth_date AS DATE) AS birth_date,
        city AS customer_city,
        country,
        postal_code,
        segment,
        CAST(registration_date AS DATE) AS registration_date,
        CAST(last_login AS DATE) AS last_login,
        is_verified,
        accepts_marketing
    FROM source
)

SELECT * FROM renamed