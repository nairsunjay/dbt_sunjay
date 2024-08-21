{{ config(
    materialized='table',
    sort=['stage_id']
) }}

with
    source as (
        select distinct stagename as stage_name, stagesortorder as stage_sort_order
        from {{ ref('stg_salesforce__opportunity') }}
    )

select
    row_number() over (order by stage_sort_order) as stage_id,  -- Surrogate Key
    stage_name,
    stage_sort_order
from source
