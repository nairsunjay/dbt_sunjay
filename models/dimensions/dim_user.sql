{{ config(
    materialized='table',
) }}

select
    u.user_id,
    u.username as user_name,
    u.firstname as first_name,
    u.lastname as last_name,
    u.companyname as company_name,
    u.division as division,
    u.department as department,
    u.title as title,
    u.street as street,
    u.city as city,
    u.state as state,
    u.postalcode as postal_code,
    u.country as country,
    u.latitude as latitude,
    u.longitude as longitude,
    u.email as email,
    u.phone as phone,
    u.mobilephone as mobile_phone,
    u.alias as alias,
    u.isactive as is_active,
    u.timezonesidkey as timezone_sid_key,
    u.localesidkey as locale_sid_key,
    u.emailencodingkey as email_encoding_key,
    u.profileid as profile_id,
    u.usertype as user_type,
    u.usersubtype as user_subtype,
    u.lastlogindate as last_login_date,
    u.createddate as created_date,
    ur.name as role_name,
    ur.parentroleid as parent_role_id,
    ur.opportunityaccessforaccountowner as opportunity_access_for_account_owner,
    ur.caseaccessforaccountowner as case_access_for_account_owner,
    ur.contactaccessforaccountowner as contact_access_for_account_owner
from {{ ref('stg_salesforce__user') }} u
left join {{ ref('stg_salesforce__user_role') }} ur on u.userroleid = ur.user_role_id
where is_active = 1
