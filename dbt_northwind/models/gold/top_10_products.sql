with cte_products as (

    select
        product_id,
        product_name
    from    
        {{ ref('filtered_products') }}

),

cte_order_details as (

    select
        product_id,
        SUM(unit_price * quantity - (discount * unit_price)) as total_price
    from
        {{ ref('filtered_order_details') }}
    group by
        product_id

),

cte_top_10_product as (

    select
        cp.product_name,
        cod.total_price
    from
        cte_products cp
    join
        cte_order_details cod
    on
        cp.product_id = cod.product_id
    order by 
        cod.total_price DESC
    limit
        10
        
)

select * from cte_top_10_product
