SELECT AVG(e.Salary)
FROM Employee AS e
WHERE e.id NOT IN (SELECT manager_id FROM Employee)
