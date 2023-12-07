SELECT *
FROM Dates

CREATE VIEW customers AS
SELECT * 
FROM customers
WHERE Name LIKE '%I'; -- This will create a view that contains all columns (*) from 
--the customers table where the Name column ends with the letter 'I'.

SELECT customerid,
FirstName || ' ' || LastName AS FullName,
Address,
UPPER(city || ' ' || country) AS Location
FROM Customers --CODE ESSENTIALLY Pull a list of customer ids with the customer’s full name, and address, 
--along with combining their city and country together IN UPPER CASE.

SELECT
    EmployeeId,
    FirstName,
    LastName,
    BirthDate,
    HireDate,
    (strftime('%Y', 'now') - strftime('%Y', HireDate)) AS YearsWorked --STRFTIME For example,
  --strftime('%Y-%m-%d', 'now') would return the current date in the format 'YYYY-MM-DD'.
FROM
    employees
WHERE
    YearsWorked >= 15
ORDER BY
    LastName ASC;
