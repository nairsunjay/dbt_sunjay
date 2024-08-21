{{ config(
    materialized='incremental',
    unique_key='case_history_id'
) }}

select
    case_history_id,
    h.status,
    h.priority,
    h.created_date,
    h.last_modified_date,
    c.account_id,
    a.account_name,
    ct.first_name as contact_first_name,
    ct.last_name as contact_last_name,
    u.username as owner_username
from {{ ref('stg_salesforce__case_history_2') }} h
left join {{ ref('fact_case') }} c
    on h.case_history_id = c.case_id
left join {{ ref('dim_account') }} a
    on c.account_id = a.account_id
left join {{ ref('dim_contact') }} ct
    on c.contact_id = ct.contact_id
left join {{ ref('dim_user') }} u
    on c.owner_id = u.user_id
