select
    segment,
    avg(amount) as avg_order_amount
from {{ ref('int_orders_joined') }}
group by 1
