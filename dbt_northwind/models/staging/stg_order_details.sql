with cte_order_details as (

    select *
    from {{source('postgres','order_details')}}

)

select * from cte_order_details