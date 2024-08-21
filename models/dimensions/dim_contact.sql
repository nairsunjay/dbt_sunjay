{{ config(
    materialized='table',
    sort=['contact_id']
) }}

select
    /* IDs */
    contact_id,
    masterrecordid as master_record_id,
    accountid as account_id,
    reportstoid as reports_to_id,
    ownerid as owner_id,
    jigsawcontactid as jigsaw_contact_id,
    individualid as individual_id,

    /* Dates */
    birthdate as birth_date,
    createddate as created_at,
    lastmodifieddate as last_modified_at,
    systemmodstamp as system_mod_stamp,
    lastactivitydate as last_activity_date,
    lastcurequestdate as last_cu_request_date,
    lastcuupdatedate as last_cu_update_date,
    emailbounceddate as email_bounced_date,

    /* Dimensions */
    salutation,
    firstname as first_name,
    lastname as last_name,
    otherstreet as other_street,
    othercity as other_city,
    otherstate as other_state,
    otherpostalcode as other_postal_code,
    othercountry as other_country,
    otherlatitude as other_latitude,
    otherlongitude as other_longitude,
    othergeocodeaccuracy as other_geocode_accuracy,
    mailingstreet as mailing_street,
    mailingcity as mailing_city,
    mailingstate as mailing_state,
    mailingpostalcode as mailing_postal_code,
    mailingcountry as mailing_country,
    mailinglatitude as mailing_latitude,
    mailinglongitude as mailing_longitude,
    mailinggeocodeaccuracy as mailing_geocode_accuracy,
    phone,
    fax,
    mobilephone as mobile_phone,
    homephone as home_phone,
    otherphone as other_phone,
    assistantphone as assistant_phone,
    email,
    title,
    department,
    assistantname as assistant_name,
    leadsource as lead_source,
    description,
    pronouns,
    genderidentity as gender_identity,
    cleanstatus as clean_status,
    emailbouncedreason as email_bounced_reason,
    level__c as level,
    languages__c as languages,

    /* Metrics */
    hasoptedoutofemail as has_opted_out_of_email,
    hasoptedoutoffax as has_opted_out_of_fax,
    donotcall as do_not_call

from {{ ref('stg_salesforce__contact') }}
where isdeleted = false
