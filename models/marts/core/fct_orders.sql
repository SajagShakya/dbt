with payments as (
    select * from {{ref( 'stg_payment') }}
),
orders as (
    select * from {{ref('stg_orders')}}
),
order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount

    from payments
    group by 1
),
 fct_orders as (
    select 
    o.order_id,
    o.customer_id,
    o.order_date,
    coalesce(p.amount, 0) as amount
    from orders as o  inner join order_payments as p using(order_id)
)

select * from fct_orders