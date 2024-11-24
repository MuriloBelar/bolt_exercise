SELECT 
    "Customer ID"::INT AS customer_id,
    "Name"::VARCHAR AS customer_name,
    "Customer Group ID"::INT AS customer_group_id,
    "Email"::VARCHAR AS customer_email,
    "Phone Number"::VARCHAR AS customer_phone_number
FROM {{source('exercise', 'customer')}}

