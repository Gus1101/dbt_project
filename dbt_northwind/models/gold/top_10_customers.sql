with cte_customers as (

    select
        customer_id,
        company_name
    from
        {{ ref('filtered_customers') }}

),

cte_orders as (

    select
        order_id,
        customer_id
    from
        {{ ref('filtered_orders') }}

),

cte_order_details as (

    select
        order_id,
        SUM(unit_price * quantity - (discount * unit_price)) as total_price
    from
        {{ ref('filtered_order_details') }}
    group by
        order_id

),

cte_top_10_customers as (

    select
        c.company_name,
        SUM(d.total_price) as total_spent
    from
        cte_orders o
    join
        cte_order_details d
    on
        o.order_id = d.order_id
    join 
        cte_customers c
    on
        o.customer_id = c.customer_id
    group by
        c.company_name
    order by
        total_spent DESC
    limit
        10
        
)

select * from cte_top_10_customers
