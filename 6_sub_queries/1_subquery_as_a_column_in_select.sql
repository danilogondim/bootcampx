-- If a query returns a single value, we can use it in our SELECT statement just like any other value:

SELECT (
  SELECT count(assignments)
  FROM assignments
)-count(assignment_submissions) as total_incomplete
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';

-- SELECT count(*)
-- FROM assignments;
-- result: 424

-- SELECT 424-count(assignment_submissions)
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.name = 'Ibrahim Schimmel';