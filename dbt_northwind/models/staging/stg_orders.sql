with cte_orders as (

    select *
    from {{source('postgres','orders')}}

)

select * from cte_orders