{{ config(
    materialized='incremental',
    unique_key='opportunity_id'
) }}

WITH latest_data AS (
    SELECT
        o.opportunity_id,
        o.opportunity_amount,
        o.opportunity_probability,
        o.close_date,
        o.created_date,
        o.last_modified_date,
        a.account_name,
        u.user_name AS owner_username,
        d.date_key AS close_date_key
    FROM {{ ref('dim_opportunity') }} o
    LEFT JOIN {{ ref('dim_account') }} a
        ON o.account_id = a.account_id
    LEFT JOIN {{ ref('dim_user') }} u
        ON o.owner_id = u.user_id
    LEFT JOIN {{ ref('dim_date') }} d
        ON o.close_date = d.date_day  -- Ensure the column name matches the one in dim_date

    WHERE o.is_deleted = FALSE
    {% if is_incremental() %}
        AND o.last_modified_date > (SELECT MAX(last_modified_date) FROM {{ this }})
    {% endif %}
)

SELECT * FROM latest_data
