with filtered_orders as (
     
    select
        order_id,
        customer_id,
        EXTRACT(YEAR FROM CAST(order_date AS TIMESTAMP)) as order_year
    from 
        {{ ref('stg_orders') }}
)

select * from filtered_orders
