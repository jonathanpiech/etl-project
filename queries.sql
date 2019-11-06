-- Create tables for raw data to be loaded into
CREATE TABLE brewery (
id INT PRIMARY KEY,
brewery_name TEXT,
type TEXT,
address TEXT,
state TEXT
);

CREATE TABLE state_pop (
id INT PRIMARY KEY,
state TEXT,
population_estimate INT
);


-- Create a view
CREATE VIEW per_capita AS
SELECT s.state, COUNT(b.brewery_name) AS brewery_count, MIN(s.population_estimate) AS pop_est
FROM brewery AS b
JOIN state_pop AS s
ON s.state = b.state
GROUP BY s.state;

-- Explore the view created
SELECT * FROM per_capita;

-- Explore the view created
SELECT state,
ROUND(CAST (brewery_count AS NUMERIC)*1000000/CAST (pop_est AS NUMERIC),2) AS per_million
FROM per_capita
ORDER BY per_million DESC;
