with payments as (
    select * from {{ ref('stg_stripe__payments') }}
),
final as (
    select
        sum(payment_amount) as total_revenue
    from payments
    where payment_status = 'success'
)
select * from final