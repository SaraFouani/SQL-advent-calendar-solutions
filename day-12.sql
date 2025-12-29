-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--

-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--

-- My Solution:

WITH daily_counts AS (
    SELECT DATE(npm.sent_at) AS message_date,
           npu.user_name,
           COUNT(npm.message_id) AS message_count
    FROM npn_messages npm
    JOIN npn_users npu ON npm.sender_id = npu.user_id
    GROUP BY DATE(npm.sent_at), npu.user_name
),
max_counts AS (
    SELECT message_date,
           MAX(message_count) AS max_count
    FROM daily_counts
    GROUP BY message_date
)
SELECT dc.message_date,
       dc.user_name,
       dc.message_count
FROM daily_counts dc
JOIN max_counts mc ON dc.message_date = mc.message_date 
                   AND dc.message_count = mc.max_count
ORDER BY dc.message_date DESC
