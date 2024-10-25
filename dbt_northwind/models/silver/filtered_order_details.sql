with filtered_order_details as (

    select
        order_id,
        product_id,
        unit_price,
        quantity,
        discount
    
    from 
        {{ref('stg_order_details')}}

)

select * from filtered_order_details