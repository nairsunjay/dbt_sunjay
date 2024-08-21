{{ config(
    materialized='table',
    sort=['pricebook_entry_id']

) }}

select
    pricebook_entry_id,
    pricebook2id as pricebook_id,
    product2id as product_id,
    unitprice as unit_price,
    isactive as is_active,
    usestandardprice as use_standard_price,
    createddate as created_date,
    createdbyid as created_by_id,
    lastmodifieddate as last_modified_date,
    lastmodifiedbyid as last_modified_by_id,
    systemmodstamp as system_modstamp
from {{ ref('stg_salesforce__pricebook_entry') }}
where isdeleted = false  -- Exclude deleted entries
order by pricebook_entry_id
