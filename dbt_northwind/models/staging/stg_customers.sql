with cte_customers as (

    select *
    from {{source('postgres','customers')}}

)

select * from cte_customers