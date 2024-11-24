SELECT 
    manufacturer::VARCHAR,
    plane::VARCHAR AS aeroplane_model,
    max_seats::INT AS max_seats,
    max_weight::INT AS max_weight,
    max_distance::INT AS max_distance,
    engine_type::VARCHAR AS engine_type
FROM {{source('exercise', 'aeroplane_model')}}
