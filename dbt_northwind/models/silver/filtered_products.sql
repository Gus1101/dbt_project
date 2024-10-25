with filtered_products as (

    select
        product_id,
        product_name,
        category_id
    
    from 
        {{ref('stg_products')}}

)

select * from filtered_products