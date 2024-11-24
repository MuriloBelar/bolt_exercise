WITH int_order_trip AS (

    SELECT * , EXTRACT(EPOCH FROM (end_timestamp_utc - start_timestamp_utc)) / 3600 AS trip_duration
    FROM {{ref('int_order_trip')}}
)
SELECT *,
       CASE
           WHEN trip_duration <= 3 THEN 'short'
           WHEN trip_duration > 3 THEN 'long'
       END AS duration_category,
        CASE
           WHEN price_in_euro <= 1000 THEN 'low cost'
           WHEN price_in_euro > 1000 AND price_in_euro <= 5000 THEN 'medium cost'
           WHEN price_in_euro > 5000 THEN 'premium'
       END AS price_category
FROM int_order_trip
