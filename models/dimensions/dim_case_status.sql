{{ config(
    materialized='table',
    sort=['status_id']
) }}

with
    source as (
        select distinct status as status_name, status as status_description 
        from {{ ref('stg_salesforce__case_history_2') }}
    )

select
    row_number() over (order by status_name) as status_id, 
    status_description
from source
