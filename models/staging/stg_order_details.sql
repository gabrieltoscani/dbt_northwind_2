with
    order_details as (
        select 
	        id
	        , orderid
	        , productid
	        , cast(unitprice as decimal(10,2)) as unitprice
	        , cast(quantity as int) as quantity
	        , cast(discount as decimal(10,2)) as discount 
            from {{source('northwind', 'ORDERDETAIL')}}
    )

select *
from order_details
order by id
