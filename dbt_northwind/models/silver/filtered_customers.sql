with filtered_customers as (

    select
        customer_id,
        company_name,
        country
    from 
        {{ref('stg_customers')}}

)

select * from filtered_customers