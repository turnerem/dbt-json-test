select
    customer_id,
    customer_name,
    segment,
    segment = 'enterprise' as is_enterprise
from {{ ref('raw_customers') }}
