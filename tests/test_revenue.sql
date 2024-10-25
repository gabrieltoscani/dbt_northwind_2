{{ config(error_if = '>10') }}
with 
    orders as (
        select *
        from {{ref("stg_orders")}}
    )

    , order_details as (
        select *
        from {{ref("stg_order_details")}}
    )

    , test_that as (
        select orderdate, sum(unitprice*quantity) as revenue
        from orders
        left join order_details on orders.id = order_details.orderid
        group by orderdate
        order by orderdate
    )

select *
from test_that
where revenue = 0