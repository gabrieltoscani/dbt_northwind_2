with
    dim_suppliers as (
        select
            {{ dbt_utils.generate_surrogate_key(['id', 'companyname']) }} as sk_supplier
            , *
        from {{ref("stg_suppliers")}}
    )

select *
from dim_suppliers