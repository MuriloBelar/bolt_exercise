SELECT * ,
    CASE
        WHEN max_seats < 100 THEN 'small'
        WHEN max_seats > 100 THEN  'big'
    END AS aeroplane_type_size
FROM {{ref('int_aeroplane')}}
