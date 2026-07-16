select
    o.order_id,
    o.customer_id,
    c.customer_name,
    c.segment,
    o.amount,
    o.status,
    o.is_completed
from {{ ref('stg_orders') }} as o
left join {{ ref('stg_customers') }} as c
    on o.customer_id = c.customer_id
