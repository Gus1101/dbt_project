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

cte_greater_than_one_thousand as (

    select
        c.company_name,
        od.total_price
    from
        cte_orders o
    join
        cte_order_details od
    on
        o.order_id = od.order_id
    join
        cte_customers c
    on
        o.customer_id = c.customer_id
    where
        od.total_price >= 1000
    order by
        od.total_price DESC
        
)

select * from cte_greater_than_one_thousand
