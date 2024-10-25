

with
    customers as (
        select *
        from {{ ref("dim_customers") }}
    )

    , products as (
        select *
        from {{ ref("dim_products") }}
    )

    , suppliers as (
        select *
        from {{ ref("dim_suppliers") }}
    )

    , orders as (
        select *
        from {{ ref("stg_orders") }}
    )

    , order_details as (
        select *
        from {{ ref("stg_order_details") }}
    )

    select 
        customers.sk_customer
        , products.sk_product
        , suppliers.sk_supplier
        , order_details.unitprice
        , order_details.quantity
        , order_details.discount
        , orders.*
    from orders
    left join order_details on orders.id = order_details.orderid
    left join customers on orders.customerid = customers.id
    left join products on order_details.productid = products.id
    left join suppliers on products.supplierid = suppliers.id
