with cte_products as (

    select *
    from {{source('postgres','products')}}

)

select * from cte_products