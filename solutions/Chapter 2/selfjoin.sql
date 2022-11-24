SELECT A.EnglishProductName,
    B.EnglishProductName,
    A.ProductSubcategoryKey
FROM DimProduct AS A, DimProduct AS B
WHERE A.ProductKey < B.ProductKey
AND A.ProductSubcategoryKey = B.ProductSubcategoryKey
ORDER BY A.ProductSubcategoryKey;
