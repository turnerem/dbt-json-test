select
    customer_id,
    customer_name,
    total_amount,
    row_number() over (order by total_amount desc) as customer_rank
from {{ ref('customer_orders') }}

