{{ config(materialized='table') }}

-- Model: customer_sales_summary
-- Purpose: Summarize each customer's total spend, total orders, and average order value.

with order_details as (
    select
        o.order_id,
        c.customer_id,
        c.name as customer_name,
        sum(p.price * oi.quantity) as order_total
    from {{ ref('orders') }} o
    join {{ ref('order_items') }} oi on o.order_id = oi.order_id
    join {{ ref('products') }} p on oi.product_id = p.product_id
    join {{ ref('customers') }} c on o.customer_id = c.customer_id
    group by 1, 2, 3
),

customer_summary as (
    select
        customer_id,
        customer_name,
        count(distinct order_id) as total_orders,
        sum(order_total) as total_spend,
        avg(order_total) as avg_order_value
    from order_details
    group by 1, 2
)

select *
from customer_summary
order by total_spend desc;
