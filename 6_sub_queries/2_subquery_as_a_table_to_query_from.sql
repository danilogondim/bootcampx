-- The result of a select is effectively a table that can be used as you would use a table
-- So a select statement may be used as a data source of another select statement.

-- to calculate the average number of students that attend a cohort. We can calculate the total number of students for each cohort and use the resulting table as a sub_table to our query.
SELECT avg(total_students) as average_students
FROM (
  SELECT count(students) as total_students
  FROM students
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts
) as totals_table;

-- The as totals_table part gives an alias to the sub query so that we can use it's name like we would use any other table's name. For example, the first line of that query could be written like this:

-- SELECT avg(totals_table.total_students) as average_students


-- SELECT count(students) as total_students
-- FROM students
-- JOIN cohorts on cohorts.id = cohort_id
-- GROUP BY cohorts;

-- result:
--  total_students 
-- ----------------
--              18
--              11
--              19
--              14
-- ...