{{ config(
    materialized='table',
    schema='dim'
) }}

WITH date_range AS (
    {{ dbt_date.get_date_dimension('2000-01-01', '2030-12-31') }}
)

SELECT 
    date_day,
    EXTRACT(YEAR FROM date_day) * 10000 + EXTRACT(MONTH FROM date_day) * 100 + EXTRACT(DAY FROM date_day) AS date_key,
    *
FROM date_range
ORDER BY date_day
