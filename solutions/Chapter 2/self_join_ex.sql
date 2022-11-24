-- Write a SQL query that returns the employee
-- name and their manager's name using the EmployeeKey
-- and ParentEmployeeKey
SELECT e.EmployeeKey,
    e.FirstName || ' ' || e.LastName AS EmployeeName,
    m.FirstName || ' ' || m.LastName AS ManagerName
FROM DimEmployee AS e, DimEmployee AS m
WHERE e.ParentEmployeeKey = m.EmployeeKey; 

