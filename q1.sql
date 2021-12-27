SELECT e.Name FROM Employee AS e
INNER JOIN Employee AS m
ON e.manager_id = m.id
WHERE e.Salary > m.Salary
