with
    products as (
        select *
        from {{source('northwind', 'SUPPLIER')}}
    )

select *
from products