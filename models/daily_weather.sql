WITH daily_weather as (
    select 
        date(time) as weather_date,
        weather,
        clouds,
        humidity,
        pressure,
        temp
    
    from {{ source('demo','weather') }}
),
AGG_CTE AS (
    SELECT weather_date,weather,
        round(avg(clouds),2) as avg_clouds,
        round(avg(humidity),2) as avg_humidity,
        round(avg(pressure),2) as avg_pressure,
        round(avg(temp),2) as avg_temp,
        row_number() over (partition by weather_date order by count(weather) desc) as most,
    FROM daily_weather 
    GROUP BY weather_date,weather 

)


select * from AGG_CTE where most =1
