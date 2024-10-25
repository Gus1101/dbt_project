with cte_products as (

    select
        product_id,
        product_name,
        category_id
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

cte_categories as (

    select
        category_id,
        category_name
    from 
        {{ ref('filtered_categories') }}

),

cte_top_10_categories as (

    select
        category_name,
        total_price
    from
        cte_products
    join
        cte_order_details
    on
        cte_products.product_id = cte_order_details.product_id
    join 
        cte_categories
    on
        cte_products.category_id = cte_categories.category_id
    order by 
        total_price DESC
    limit
        10
        
)

select * from cte_top_10_categories