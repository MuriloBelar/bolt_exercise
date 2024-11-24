SELECT 
    "Airplane ID"::VARCHAR AS aeroplane_id,
    "Airplane Model"::VARCHAR AS aeroplane_model,
    "Manufacturer"::VARCHAR AS manufacturer
FROM {{source('exercise', 'aeroplane')}}