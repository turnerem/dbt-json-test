select
    c.customer_id,
    c.customer_name,
    c.segment,
    count(o.order_id)                                       as num_orders,
    sum(o.amount)                                           as total_amount,
    sum(case when o.is_completed then o.amount else 0 end)  as completed_amount
from {{ ref('raw_customers') }} as c
left join {{ ref('stg_orders') }} as o
    on c.customer_id = o.customer_id
group by 1, 2, 3
