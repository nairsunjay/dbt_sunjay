{{ config(
    materialized='table',
    sort=['record_type_id']
) }}

select
    solution_id,
    solutionnumber as solution_number,
    solutionname as solution_name,
    ispublished as is_published,
    ispublishedinpublickb as is_published_in_public_kb,
    status as solution_status,
    isreviewed as is_reviewed,
    solutionnote as solution_note,
    caseid as case_id,
    ownerid as owner_id,
    createddate as created_date,
    createdbyid as created_by_id,
    lastmodifieddate as last_modified_date,
    lastmodifiedbyid as last_modified_by_id,
    systemmodstamp as system_modstamp,
    timesused as times_used,
    ishtml as is_html
from {{ ref('stg_salesforce__solution') }}
where isdeleted = false
order by solution_name
