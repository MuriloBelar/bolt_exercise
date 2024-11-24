WITH aeroplane AS (
    SELECT
        *
    FROM {{ref('aeroplane_staging')}}
)
,
aeroplane_model AS (
    SELECT
            *
    FROM {{ref('aeroplane_model_staging')}}
)

SELECT 
    aeroplane.aeroplane_id,
    aeroplane.aeroplane_model,
    aeroplane.manufacturer,
    aeroplane_model.max_seats,
    aeroplane_model.max_weight,
    aeroplane_model.max_distance,
    aeroplane_model.engine_type,
    CASE
        WHEN aeroplane_model.max_seats < 100 THEN 'small'
        WHEN aeroplane_model.max_seats > 100 THEN  'big'
    END AS aeroplane_type_size
FROM aeroplane

LEFT JOIN aeroplane_model
ON aeroplane.aeroplane_model = aeroplane_model.aeroplane_model
AND aeroplane.manufacturer = aeroplane_model.manufacturer