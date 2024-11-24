SELECT 
    "ID"::INT AS customer_group_id,
    "Type" AS customer_group_type,
    "Name"::VARCHAR AS customer_group_name,
    "Registry number"::VARCHAR customer_group_registry_number
FROM {{source('exercise', 'customer_group')}}