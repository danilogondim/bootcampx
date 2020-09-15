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

-- We can also use a subquery to create a list to use the word ALL to allow >= or > or < or <=to act over such list (reference: https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial // https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial?answer=1):

-- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
-- SELECT name
-- FROM world
-- WHERE gdp > ALL(
--   SELECT gdp
--   FROM world
--   WHERE continent='Europe'
--   AND gdp >0
--   );

-- We can refer to values in the outer SELECT within the inner SELECT. We can name the tables so that we can tell the difference between the inner and outer versions.
-- Find the largest country (by area) in each continent, show the continent, the name and the area:
-- SELECT continent, name, area FROM world x
--   WHERE area >= ALL
--     (SELECT area FROM world y
--         WHERE y.continent=x.continent
--           AND area>0)

-- The above example is known as a correlated or synchronized sub-query.
-- Using correlated subqueries
-- A correlated subquery works like a nested loop: the subquery only has access to rows related to a single record at a time in the outer query. The technique relies on table aliases to identify two different uses of the same table, one in the outer query and the other in the subquery.
-- One way to interpret the line in the WHERE clause that references the two table is “… where the correlated values are the same”.
-- In the example provided, you would say “select the country details from world where the population is greater than or equal to the population of all countries where the continent is the same”.

-- List each continent and the name of the country that comes first alphabetically.
-- SELECT continent, name FROM world x
--   WHERE x.name <= ALL(SELECT name FROM world y
--          WHERE x.continent = y.continent
-- )


-- Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
-- SELECT name,continent,population FROM world x
--   WHERE 25000000 >= ALL (
--     SELECT population FROM world y
--      WHERE x.continent=y.continent
--        AND y.population>0)


-- Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
-- SELECT name, continent FROM world x WHERE
--  population > ALL
--  (SELECT population*3 FROM world y
--  WHERE y.continent = x.continent
--  AND y.name != x.name)

-- or

-- SELECT name, continent
-- FROM world x
-- WHERE population/3 >= ALL (select population from world y where x.continent=y.continent and y.population>0 and x.name<>y.name);