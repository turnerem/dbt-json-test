select
    customer_id,
    customer_name,
    segment,
    count(*)                                            as num_orders,
    sum(case when is_completed then amount else 0 end)  as lifetime_value
from {{ ref('int_orders_joined') }}
group by 1, 2, 3
