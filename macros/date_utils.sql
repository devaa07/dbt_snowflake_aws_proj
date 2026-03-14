{% macro fun(x) %}
        STARTTIME,
        TO_TIMESTAMP(REPLACE({{x}}, '"', '')) as start_time,
        DATE(TO_TIMESTAMP(REPLACE({{x}}, '"', ''))) AS date_start_time,
        HOUR(TO_TIMESTAMP(REPLACE({{x}}, '"', ''))) AS start_time_hour,
        DAYNAME(TO_TIMESTAMP(REPLACE({{x}}, '"', ''))) AS DAY_NAME,
        CASE 
            WHEN DAYNAME(TO_TIMESTAMP(REPLACE({{x}}, '"', ''))) IN ('Sat','Sun') 
            then 'WEEKEND' 
            else 'BUSINESSDAY'
        END AS DAY_TYPE,
        CASE WHEN MONTH(TO_TIMESTAMP(REPLACE({{x}}, '"', ''))) IN (12,1,2) then 'WINTER'
             WHEN MONTH(TO_TIMESTAMP(REPLACE({{x}}, '"', ''))) IN (3,4,5) THEN 'SPRING'
             WHEN MONTH(TO_TIMESTAMP(REPLACE({{x}}, '"', ''))) IN (6,7,8) THEN 'SUMMER'
             ELSE 'AUTUM'
        END AS STATUS_TYPE,
        CASE 
            WHEN DATE(TO_TIMESTAMP(REPLACE({{x}}, '"', ''))) < CURRENT_DATE 
             THEN 'PAST' 
            ELSE 'FUTURE'
        END 
{%  endmacro %}