WITH customer AS (
    SELECT
        *
    FROM {{ref('customer_staging')}}
)
,
customer_group AS (
    SELECT
            *
    FROM {{ref('customer_group_staging')}}
)

SELECT 
    customer.customer_id,
    customer.customer_name,
    customer_group.customer_group_type,
    customer_group.customer_group_name,
    customer_group.customer_group_registry_number,
    customer.customer_email,
    customer.customer_phone_number
FROM customer

LEFT JOIN customer_group
ON customer.customer_group_id = customer_group.customer_group_id