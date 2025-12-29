-- SQL Advent Calendar - Day 3
-- Title: The Grinch's Best Pranks Per Target
-- Difficulty: hard
--
-- Question:
-- The Grinch has brainstormed a ton of pranks for Whoville, but he only wants to keep the top prank per target, with the highest evilness score. Return the most evil prank for each target. If two pranks have the same evilness, the more recently brainstormed wins.
--
-- The Grinch has brainstormed a ton of pranks for Whoville, but he only wants to keep the top prank per target, with the highest evilness score. Return the most evil prank for each target. If two pranks have the same evilness, the more recently brainstormed wins.
--

-- Table Schema:
-- Table: grinch_prank_ideas
--   prank_id: INTEGER
--   target_name: VARCHAR
--   prank_description: VARCHAR
--   evilness_score: INTEGER
--   created_at: TIMESTAMP
--

-- My Solution:

SELECT g1.*
FROM grinch_prank_ideas g1
WHERE (g1.evilness_score, g1.created_at) = (
    SELECT evilness_score, MAX(created_at)
    FROM grinch_prank_ideas g2
    WHERE g2.target_name = g1.target_name
    AND g2.evilness_score = (
        SELECT MAX(evilness_score)
        FROM grinch_prank_ideas g3
        WHERE g3.target_name = g1.target_name
    )
);
