WITH EmployeeSales AS (
    SELECT
        e.FirstName || ' ' || e.LastName AS EmployeeName,
        e.Title,
        SUM(i.Total) AS TotalSalesGenerated
    FROM Employee e
    JOIN Customer c ON e.EmployeeId = c.SupportRepId
    JOIN Invoice i ON c.CustomerId = i.CustomerId
    GROUP BY e.EmployeeId
)
SELECT
    EmployeeName,
    Title,
    TotalSalesGenerated,
    DENSE_RANK() OVER (ORDER BY TotalSalesGenerated DESC) AS SalesRank
FROM EmployeeSales
WHERE SalesRank <= 3;
