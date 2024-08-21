{{ config(
    materialized='table',
    sort=['campaign_id']
) }}

select
    /* IDs */
    campaign_id,
    parentid as parent_campaign_id,
    ownerid as owner_id,
    createdbyid as created_by_id,
    lastmodifiedbyid as last_modified_by_id,
    campaignmemberrecordtypeid as campaign_member_record_type_id,

    /* Dates */
    startdate as start_date,
    enddate as end_date,
    createddate as created_at,
    lastmodifieddate as last_modified_at,
    systemmodstamp as system_mod_stamp,
    lastactivitydate as last_activity_date,

    /* Dimensions */
    name as campaign_name,
    type as campaign_type,
    status,
    description,
    isactive as is_active,

    /* Metrics */
    expectedrevenue as expected_revenue,
    budgetedcost as budgeted_cost,
    actualcost as actual_cost,
    expectedresponse as expected_response,
    numbersent as number_sent,
    numberofleads as number_of_leads,
    numberofconvertedleads as number_of_converted_leads,
    numberofcontacts as number_of_contacts,
    numberofresponses as number_of_responses,
    numberofopportunities as number_of_opportunities,
    numberofwonopportunities as number_of_won_opportunities,
    amountallopportunities as amount_all_opportunities,
    amountwonopportunities as amount_won_opportunities,
    hierarchynumberofleads as hierarchy_number_of_leads,
    hierarchynumberofconvertedleads as hierarchy_number_of_converted_leads,
    hierarchynumberofcontacts as hierarchy_number_of_contacts,
    hierarchynumberofresponses as hierarchy_number_of_responses,
    hierarchynumberofopportunities as hierarchy_number_of_opportunities,
    hierarchynumberofwonopportunities as hierarchy_number_of_won_opportunities,
    hierarchyamountallopportunities as hierarchy_amount_all_opportunities,
    hierarchyamountwonopportunities as hierarchy_amount_won_opportunities,
    hierarchynumbersent as hierarchy_number_sent,
    hierarchyexpectedrevenue as hierarchy_expected_revenue,
    hierarchybudgetedcost as hierarchy_budgeted_cost,
    hierarchyactualcost as hierarchy_actual_cost

from {{ ref('stg_salesforce__campaign') }}
where isdeleted = false
