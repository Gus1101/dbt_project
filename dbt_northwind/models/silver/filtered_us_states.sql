with filtered_us_states as (

    select
        state_id,
        state_name
    
    from 
        {{ref('stg_us_states')}}

)

select * from filtered_us_states