WITH station AS (
    SELECT 
        start_station_id as station_id,
        start_station_name as station_name,
        start_station_latitude as station_lat,
        start_station_longitude as station_long
    FROM {{source('demo','bike_trips')}} limit 10
)

select * from station