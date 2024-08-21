{{ config(
    materialized='table',
    sort=['product_sales_id']
) }}

WITH source AS (
    SELECT * 
    FROM {{ source('salesforce', 'pricebook_entry') }}
)

SELECT
    ROW_NUMBER() OVER (ORDER BY createddate) AS product_sales_id,  -- Surrogate Key
    opportunityid AS opportunity_fk,                               -- Foreign Key to fact_opportunity
    product2id AS product_fk,                                      -- Foreign Key to dim_product
    pricebook2id AS pricebook_fk,                                  -- Foreign Key to dim_pricebook (if applicable)
    unitprice AS unit_price,
    isactive AS is_active,
    createddate AS product_sales_created_at,
    lastmodifieddate AS product_sales_last_modified_date
FROM source
