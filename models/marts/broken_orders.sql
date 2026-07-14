-- BUG (deliberate): `order_total` does not exist on stg_orders.
-- The real column is `amount`. This raises a Binder Error at run time,
-- producing a FAILED node event that should still carry node_info.meta.
select
    order_id,
    customer_id,
    order_total
from {{ ref('stg_orders') }}
