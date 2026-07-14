select * from (
    values
        (101, 'Acme Corp', 'enterprise'),
        (102, 'Beta LLC',  'smb'),
        (103, 'Gamma Inc', 'enterprise')
) as t(customer_id, customer_name, segment)
