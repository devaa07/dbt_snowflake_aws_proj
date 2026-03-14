with cte as (
    select
        {{fun('STARTTIME')}}
    from {{ source('demo', 'bike_trips') }}
    limit 10
)

select * from cte