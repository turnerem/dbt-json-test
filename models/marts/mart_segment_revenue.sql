select
    segment,
    count(*)                                               as num_orders,
    sum(amount)                                            as total_amount,
    sum(case when is_completed then amount else 0 end)     as completed_amount
from {{ ref('int_orders_joined') }}
group by 1
