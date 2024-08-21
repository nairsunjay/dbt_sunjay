{{ config(
    materialized='table',
    sort=['product_id']

) }}

select
    product_id,
    name as product_name,
    productcode as product_code,
    description as product_description,
    isactive as is_active,
    createddate as created_date,
    createdbyid as created_by_id,
    lastmodifieddate as last_modified_date,
    lastmodifiedbyid as last_modified_by_id,
    systemmodstamp as system_modstamp,
    family as product_family,
    externaldatasourceid as external_datasource_id,
    externalid as external_id,
    displayurl as display_url,
    quantityunitofmeasure as quantity_unit_of_measure,
    stockkeepingunit as stock_keeping_unit,
    type as product_type,
    productclass as product_class,
    sourceproductid as source_product_id,
    sellerid as seller_id
from {{ ref("stg_salesforce__product_2") }}
where isdeleted = false
-- isactive =1 ?
order by product_name
