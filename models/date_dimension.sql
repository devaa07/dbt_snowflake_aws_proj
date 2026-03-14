with cte as (
    select
        {{fun('STARTTIME')}}
    from {{ source('demo', 'bike_trips') }}
)

select * from cte