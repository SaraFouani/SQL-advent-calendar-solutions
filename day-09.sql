-- SQL Advent Calendar - Day 9
-- Title: Tinsel and Light Combinations
-- Difficulty: hard
--
-- Question:
-- The elves are testing new tinsel–light combinations to find the next big holiday trend. Write a query to generate every possible pairing of tinsel colors and light colors, include in your output a column that combines the two values separated with a dash ("-").
--
-- The elves are testing new tinsel–light combinations to find the next big holiday trend. Write a query to generate every possible pairing of tinsel colors and light colors, include in your output a column that combines the two values separated with a dash ("-"). 
--

-- Table Schema:
-- Table: tinsel_colors
--   tinsel_id: INT
--   color_name: VARCHAR
--
-- Table: light_colors
--   light_id: INT
--   color_name: VARCHAR
--

-- My Solution:

-- Generate all possible tinsel and light color combinations
SELECT 
  t.tinsel_id,
  t.color_name AS tinsel_color,
  l.light_id,
  l.color_name AS light_color,
  t.color_name || '-' || l.color_name AS combination
FROM tinsel_colors t
CROSS JOIN light_colors l
ORDER BY t.color_name, l.color_name;
