WITH city AS (
SELECT origin_city as city FROM {{ref('trip_staging')}}

UNION

SELECT destination_city AS city FROM {{ref('trip_staging')}}
)

SELECT 
    city,
       CASE city
           WHEN 'Mexico City' THEN 6
           WHEN 'London' THEN 0
           WHEN 'Paris' THEN -1
           WHEN 'Beijing' THEN -8
           WHEN 'Sydney' THEN -10
           WHEN 'New York' THEN 5
           WHEN 'Tokyo' THEN -9
           WHEN 'San Francisco' THEN 8
           WHEN 'Berlin' THEN -1
           WHEN 'Auckland' THEN -12
           WHEN 'Mumbai' THEN -5
           WHEN 'Chicago' THEN 6
           WHEN 'Singapore' THEN -8
           WHEN 'Bangkok' THEN -7
           WHEN 'Moscow' THEN -3
           WHEN 'Cape Town' THEN -2
           WHEN 'Amsterdam' THEN -1
           WHEN 'Madrid' THEN -1
           WHEN 'Los Angeles' THEN 8
           WHEN 'Vancouver' THEN 8
           WHEN 'Toronto' THEN 5
           WHEN 'Johannesburg' THEN -2
           WHEN 'Hong Kong' THEN -8
           WHEN 'Sao Paulo' THEN 3
           WHEN 'Frankfurt' THEN -1
           WHEN 'Miami' THEN 5
           WHEN 'Melbourne' THEN -10
           WHEN 'Rio de Janeiro' THEN 3
           WHEN 'Dubai' THEN -4
           ELSE NULL
       END AS utc_offset_hours
FROM city