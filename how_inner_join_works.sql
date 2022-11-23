-- draft from chapter 2
SELECT (SELECT COUNT(*) FROM FactInternetSales) AS Total, 
count(*) AS Intersection
FROM FactInternetSales 
WHERE OrderDate  IN
(
  SELECT OrderDate
  FROM FactInternetSales
  INTERSECT
  SELECT Date
  FROM FactSurveyResponse
  );


-- How INNER JOIN WORKS

SELECT b.Date,
    t.DatesSurvey,
    SUM(DatesSurvey) OVER() 
    AS FactSurveyRows,
    ti.DatesInternet,
    SUM(DatesInternet) OVER() 
    AS FactInternetRows,
    COUNT(*) AS DateCount,
    (t.DatesSurvey * ti.DatesInternet 
    - COUNT(*)) AS Difference,
    SUM(COUNT(*)) OVER() 
    AS TotalRows
FROM
FactInternetSales a
INNER JOIN
FactSurveyResponse b
ON
a.OrderDate = b.Date
INNER JOIN
(
  SELECT Date, 
      COUNT(*) AS DatesSurvey
  FROM FactSurveyResponse
  GROUP BY Date) AS t
ON t.Date = b.Date
INNER JOIN
(
  SELECT OrderDate, 
      COUNT(*) AS DatesInternet
  FROM FactInternetSales 
  WHERE OrderDate  IN
  (
    SELECT DISTINCT OrderDate
    FROM FactInternetSales AS i
    INNER JOIN FactSurveyResponse AS s
    ON i.OrderDate = s.Date
    )
  GROUP BY OrderDate
) AS ti
ON ti.OrderDate = b.Date
GROUP BY b.Date;