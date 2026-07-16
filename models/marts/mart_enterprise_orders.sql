select
    order_id,
    customer_id,
    customer_name,
    amount,
    status
from {{ ref('int_orders_joined') }}
where segment = 'enterprise'
