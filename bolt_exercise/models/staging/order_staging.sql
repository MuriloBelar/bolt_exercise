SELECT 
    "Order ID"::INT AS order_id,
    "Customer ID"::INT AS customer_id,
    "Trip ID"::INT AS trip_id,
    "Price (EUR)"::FLOAT AS price_in_euro,
    "Seat No"::VARCHAR AS seat_number,
    "Status"::VARCHAR AS order_status
FROM {{source('exercise', 'order')}}