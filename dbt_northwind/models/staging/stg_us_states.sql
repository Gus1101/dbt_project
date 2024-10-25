with cte_us_states as (

    select *
    from {{source('postgres','us_states')}}

)

select * from cte_us_states