with
    customers as (
        select 
            id
            , companyname
            , contactname
            , address
            , city
            , country
            , 1 as teste
        from {{source('northwind', 'CUSTOMER')}}
    )

select *
from customers