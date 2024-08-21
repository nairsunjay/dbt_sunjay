-- fact_lead_conversion.sql

with lead_data as (
    select 
        lead_id,
        lead_salutation,
        first_name,
        last_name,
        lead_company,
        lead_source,
        lead_status,
        is_converted,
        converted_date,
        converted_account_id,
        converted_contact_id,
        converted_opportunity_id,
        created_date as lead_created_date,
        last_modified_date as lead_last_modified_date
    from 
        {{ ref('dim_lead') }}
    where 
        is_converted = true
),

account_data as (
    select 
        account_id,
        account_name
    from 
        {{ ref('dim_account') }}
),

opportunity_data as (
    select 
        opportunity_id,
        opportunity_name,
        opportunity_amount
    from 
        {{ ref('dim_opportunity') }}
)

select 
    l.lead_id,
    l.first_name,
    l.last_name,
    l.lead_company,
    l.lead_source,
    l.lead_status,
    l.converted_date,
    a.account_name as converted_account_name,
    o.opportunity_name as converted_opportunity_name,
    o.opportunity_amount as converted_opportunity_amount,
    l.lead_created_date,
    l.lead_last_modified_date
from 
    lead_data l
left join 
    account_data a on l.converted_account_id = a.account_id
left join 
    opportunity_data o on l.converted_opportunity_id = o.opportunity_id
