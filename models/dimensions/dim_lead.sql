{{ config(
    materialized='table',
    sort=['lead_id']
) }}

select
    lead_id,
    masterrecordid as master_record_id,
    salutation as lead_salutation,
    firstname as first_name,
    lastname as last_name,
    title as lead_title,
    company as lead_company,
    street as lead_street,
    city as lead_city,
    state as lead_state,
    postalcode as lead_postal_code,
    country as lead_country,
    latitude as lead_latitude,
    longitude as lead_longitude,
    geocodeaccuracy as geocode_accuracy,
    phone as lead_phone,
    mobilephone as lead_mobile_phone,
    fax as lead_fax,
    email as lead_email,
    website as lead_website,
    description as lead_description,
    leadsource as lead_source,
    status as lead_status,
    industry as lead_industry,
    rating as lead_rating,
    annualrevenue as annual_revenue,
    numberofemployees as number_of_employees,
    ownerid as owner_id,
    hasoptedoutofemail as has_opted_out_of_email,
    isconverted as is_converted,
    converteddate as converted_date,
    convertedaccountid as converted_account_id,
    convertedcontactid as converted_contact_id,
    convertedopportunityid as converted_opportunity_id,
    isunreadbyowner as is_unread_by_owner,
    createddate as created_date,
    createdbyid as created_by_id,
    lastmodifieddate as last_modified_date,
    lastmodifiedbyid as last_modified_by_id,
    systemmodstamp as system_mod_stamp,
    lastactivitydate as last_activity_date,
    donotcall as do_not_call,
    hasoptedoutoffax as has_opted_out_of_fax,
    lasttransferdate as last_transfer_date,
    jigsaw as jigsaw_id,
    jigsawcontactid as jigsaw_contact_id,
    cleanstatus as clean_status,
    companydunsnumber as company_duns_number,
    dandbcompanyid as dandb_company_id,
    emailbouncedreason as email_bounced_reason,
    emailbounceddate as email_bounced_date,
    individualid as individual_id,
    pronouns as lead_pronouns,
    genderidentity as gender_identity,
    siccode__c as sic_code,
    productinterest__c as product_interest,
    primary__c as is_primary,
    currentgenerators__c as current_generators,
    numberoflocations__c as number_of_locations
from {{ ref('stg_salesforce__lead') }}
where isdeleted = false  -- Exclude deleted leads
order by last_name, first_name
