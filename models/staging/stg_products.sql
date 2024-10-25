with
    products as (
        select *
        from {{source('northwind', 'PRODUCT')}}
    )

select *
from products