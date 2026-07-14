select * from (
    values
        (1, 101, 250.00, 'completed'),
        (2, 102, 125.50, 'completed'),
        (3, 101,  75.25, 'returned'),
        (4, 103, 500.00, 'completed'),
        (5, 102,  60.00, 'pending')
) as t(order_id, customer_id, amount, status)
