with cte_categories as (

    select *
    from {{source('postgres','categories')}}

)

select * from cte_categories