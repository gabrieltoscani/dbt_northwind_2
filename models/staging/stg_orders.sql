with
    orders as (
        select 
	cast(ID as int) as ID,
	CUSTOMERID,
	EMPLOYEEID,
	cast(ORDERDATE as date) as ORDERDATE,
	cast(REQUIREDDATE as date) as REQUIREDDATE,
	cast(SHIPPEDDATE as date) as SHIPPEDDATE,
	SHIPVIA,
	cast(FREIGHT as decimal(10,2)) as FREIGHT,
	SHIPNAME,
	SHIPADDRESS,
	SHIPCITY,
	SHIPREGION,
	SHIPPOSTALCODE,
	SHIPCOUNTRY
        from {{source('northwind', '_ORDER_')}}
        {% if env_var("DBT_DEV_SCHEMA") == 'DEV' %}
  -- this filter will only be applied to the development schema
  limit 100
        {% endif %}
    )

select *
from orders