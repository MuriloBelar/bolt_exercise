SELECT 
    "Trip ID"::INT AS trip_id,
    "Origin City"::VARCHAR AS origin_city,
    "Destination City"::VARCHAR AS destination_city,
    "Airplane ID"::INT AS aeroplane_id,
    "Start Timestamp"::TIMESTAMP AS start_timestamp,
    "End Timestamp"::TIMESTAMP AS end_timestamp
FROM {{source('exercise', 'trip')}}

