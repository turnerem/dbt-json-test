select *
from {{ ref('stg_orders') }}
where is_completed
