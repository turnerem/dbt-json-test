select
    order_id,
    customer_id,
    amount,
    status,
    case when status = 'completed' then true else false end as is_completed
from {{ ref('raw_orders') }}
