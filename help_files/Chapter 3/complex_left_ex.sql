-- Practice both inner and left outer joins by combining
-- Reseller with DimGeography and output the Reseller 
-- mailing addresses for customers within a geographic
-- region of your choice. 
-- The region can be passed through a where clause. 
-- Also, return the products sold for those resellers
-- and their product subcategory.
-- Hint
-- More than one customer can buy the same product, and a
-- customer can buy more than one product.
SELECT

  ResellerName,
  AddressLine1,
  AddressLine2,
  City,
  StateProvinceCode,
  PostalCode,
  g.CountryRegionCode,
  rs.ProductKey,
  p.ProductSubcategoryKey,
  rs.SalesAmount  
FROM DimReseller AS r
-- No matters if not has resaled
LEFT JOIN FactResellerSales AS rs
USING (ResellerKey)
INNER JOIN DimGeography AS g
ON r.GeographyKey = g.GeographyKey
-- No matters if not has resaled
LEFT JOIN DimProduct AS p
ON rs.ProductKey = p.ProductKey
WHERE g.CountryRegionCode = 'US'
ORDER BY rs.SalesAmount;




