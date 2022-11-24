-- Practice left joins between DimCustomer and the two views with
-- DimCustomer as your base table.

-- Include CustomerKey, FirstName and LastName from DimCustomer,
-- EmailAddress from the customer_email_a view, and GeographyKey 
-- from the customer_address_us view in your results.
SELECT d.CustomerKey, FirstName, LastName, ce.EmailAddress, us.GeographyKey
FROM DimCustomer AS d
LEFT JOIN customer_email_a AS ce
ON d.CustomerKey = ce.CustomerKey
LEFT JOIN customer_address_us AS us
ON d.CustomerKey = us.CustomerKey;

-- Write a left join that returns the ProductKey 
-- from DimProduct and the total sales for each product
-- from FactInternetSales.

SELECT d.ProductKey, SUM(f.SalesAmount) AS TotalSales
FROM DimProduct AS d
LEFT JOIN FactInternetSales AS f
USING (ProductKey)
GROUP BY 1;



-- Write another left join query that returns the ProductKey
-- and EnglishProductName from the DimProduct and the OrderDate,
-- OrderQuantity, and SalesAmount from FactInternetSales.

SELECT d.ProductKey, EnglishProductName, OrderDate, OrderQuantity, SalesAmount
FROM DimProduct AS d
LEFT JOIN FactInternetSales AS f
ON d.ProductKey = f.ProductKey
ORDER BY 1;
