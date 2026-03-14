WITH trip AS (
    SELECT 
        bikeid,
        usertype,
        DATE(TO_TIMESTAMP(REPLACE(STARTTIME,'"',''))) AS START_DATE,
        DATE(TO_TIMESTAMP(REPLACE(STOPTIME,'"',''))) AS END_DATE,
        START_STATION_ID,
        END_STATION_ID,
        TRIPDURATION
    FROM {{source('demo','bike_trips')}}
)

select * from trip