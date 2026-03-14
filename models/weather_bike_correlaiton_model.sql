WITH Join_CTE AS (
    SELECT t.*,w.* FROM {{ ref('trip_fact') }} t left join {{ ref('daily_weather') }} w 
    on t.start_date = w.weather_date 
)

select * from Join_CTE