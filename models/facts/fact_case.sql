{{ config(
    materialized='incremental',
    unique_key='case_id'
) }}

select
    c.case_id,
    c.status,
    c.priority,
    c.origin,
    c.createddate,
    c.lastmodifieddate,
    a.account_name,
    ct.first_name as contact_first_name,
    ct.last_name as contact_last_name,
    u.user_name as owner_username,
    d.date_key as created_date_key
from {{ ref('stg_salesforce__case') }} c
left join {{ ref('dim_account') }} a
    on c.accountid = a.account_id
left join {{ ref('dim_contact') }} ct
    on c.contactid = ct.contact_id
left join {{ ref('dim_user') }} u
    on c.ownerid = u.user_id
left join {{ ref('dim_date') }} d
    on c.createddate = d.date_day
where c.isdeleted = false
