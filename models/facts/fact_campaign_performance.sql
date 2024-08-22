{{ config(
    materialized='table',
    sort=['campaign_id']
) }}

WITH campaign_performance AS (
    SELECT
        c.campaign_id,
        c.created_at,
        c.last_modified_at,
        c.start_date,
        c.end_date,
        c.owner_id as user_id,
        o.opportunity_id,
        c.expected_revenue,
        c.budgeted_cost,
        c.actual_cost,
        c.number_sent,
        c.number_of_leads,
        c.number_of_converted_leads,
        c.number_of_contacts
    FROM {{ ref('dim_campaign') }} c
    LEFT JOIN {{ ref('dim_opportunity') }} o ON c.campaign_id = o.campaign_id
)

SELECT
    cp.campaign_id,
    cp.user_id,
    cp.opportunity_id,
    cp.start_date,
    cp.end_date,
    cp.expected_revenue,
    cp.budgeted_cost,
    cp.actual_cost,
    cp.number_sent,
    cp.number_of_leads,
    cp.number_of_converted_leads,
    cp.number_of_contacts
FROM campaign_performance cp


--need to be improved - No of leads closed based a particular campaign 