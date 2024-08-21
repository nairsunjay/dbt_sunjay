{{ config(
    materialized='incremental',
    unique_key='history_id'
) }}

select
    h.id as history_id,
    h.amount,
    h.probability,
    h.close_date,
    h.created_date,
    h.last_modified_date,
    o.stage_name,
    a.account_name,
    u.username as owner_username
from {{ ref('stg_salesforce__opportunity_history') }} h
left join {{ ref('fact_opportunity') }} o
    on h.opportunity_history_id = o.opportunity_id
left join {{ ref('dim_account') }} a
    on o.account_id = a.account_id
left join {{ ref('dim_user') }} u
    on o.owner_id = u.user_id
