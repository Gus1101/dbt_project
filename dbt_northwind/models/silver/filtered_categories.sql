with filtered_categories as (

    select
        category_id,
        category_name
    from 
        {{ref('stg_categories')}}

)

select * from filtered_categories