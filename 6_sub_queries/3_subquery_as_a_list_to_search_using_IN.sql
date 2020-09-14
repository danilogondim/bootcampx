-- A sub query's results can also be used within the WHERE clause of a query if it returns a list of values(in other words, it returns a single column). This list can be used in a WHERE clause with the IN statement 


-- This will return the name of all assignments not completed by 'Ibrahim Schimmel':
SELECT assignments.name
FROM assignments 
WHERE id NOT IN
(
  SELECT assignment_id
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel'
);