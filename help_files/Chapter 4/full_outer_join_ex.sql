-- Perform a full outer join between US customers 
-- and the Internet Sales.
-- You can use the customer_address_us view created earlier.
-- 21344 c L f, 39054, total 60398
SELECT c.CustomerKey AS cCustomerKey, f.*
FROM customer_address_us AS c
LEFT JOIN FactInternetSales AS f
USING (CustomerKey)
UNION
SELECT c.CustomerKey AS cCustomerKey, f.*
FROM FactInternetSales AS f
LEFT JOIN customer_address_us AS c
USING (CustomerKey)

