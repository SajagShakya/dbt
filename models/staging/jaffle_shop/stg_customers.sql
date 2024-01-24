with customers as (

    select
        id as customer_id,
        first_name,
        last_name

    from {{source('dbt_RAW_jaffle_shop','customers')}}

)

select * from customers