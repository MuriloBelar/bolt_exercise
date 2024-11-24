WITH order_model AS (
    SELECT
        *
    FROM {{ref('order_staging')}}
)
,
trip AS (
    SELECT
            *
    FROM {{ref('trip_staging')}}
),
city_timezone AS (
    SELECT * FROM
    {{ref('dim_city')}}
)
SELECT 
    order_model.order_id,
    order_model.customer_id, 
    trip.aeroplane_id, 
    order_model.price_in_euro, 
    order_model.seat_number, 
    order_model.order_status,
    trip.origin_city, 
    trip.destination_city, 
    trip.start_timestamp + INTERVAL '1 hour' * city_timezone_origin.utc_offset_hours  AS start_timestamp_utc,
    trip.end_timestamp + INTERVAL '1 hour' * city_timezone_destination.utc_offset_hours  AS end_timestamp_utc
    
FROM order_model

LEFT JOIN trip
ON order_model.trip_id = trip.trip_id

LEFT JOIN city_timezone AS city_timezone_origin
ON city_timezone_origin.city = trip.origin_city

LEFT JOIN city_timezone AS city_timezone_destination
ON city_timezone_destination.city = trip.destination_city
