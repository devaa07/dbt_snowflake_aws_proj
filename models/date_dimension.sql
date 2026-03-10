with cte as (
    select
        STARTTIME,
        TO_TIMESTAMP(REPLACE(STARTTIME, '"', '')) as start_time,
        DATE(TO_TIMESTAMP(REPLACE(STARTTIME, '"', ''))) AS date_start_time,
        HOUR(TO_TIMESTAMP(REPLACE(STARTTIME, '"', ''))) AS start_time_hour,
        DAYNAME(TO_TIMESTAMP(REPLACE(STARTTIME, '"', ''))) AS DAY_NAME,
        CASE 
            WHEN DAYNAME(TO_TIMESTAMP(REPLACE(STARTTIME, '"', ''))) IN ('Sat','Sun') 
            then 'WEEKEND' 
            else 'BUSINESSDAY'
        END AS DAY_TYPE,
        CASE WHEN MONTH(TO_TIMESTAMP(REPLACE(STARTTIME, '"', ''))) IN (12,1,2) then 'WINTER'
             WHEN MONTH(TO_TIMESTAMP(REPLACE(STARTTIME, '"', ''))) IN (3,4,5) THEN 'SPRING'
             WHEN MONTH(TO_TIMESTAMP(REPLACE(STARTTIME, '"', ''))) IN (6,7,8) THEN 'SUMMER'
             ELSE 'AUTUM'
        END AS STATUS_TYPE
    from {{ source('demo', 'bike_trips') }}
    limit 10
)

select * from cte