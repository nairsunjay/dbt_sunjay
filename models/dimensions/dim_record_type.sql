{{ config(
    materialized='table',
    sort=['record_type_id']

) }}

select
    record_type_id,
    name as record_type_name,
    modulenamespace as module_namespace,
    description as record_type_description,
    businessprocessid as business_process_id,
    sobjecttype as sobject_type,
    isactive as is_active,
    createdbyid as created_by_id,
    createddate as created_date,
    lastmodifiedbyid as last_modified_by_id,
    lastmodifieddate as last_modified_date,
    systemmodstamp as system_modstamp
from {{ ref('stg_salesforce__record_type') }}
where isdeleted = false
order by record_type_name
