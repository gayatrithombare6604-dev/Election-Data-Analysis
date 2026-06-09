-- Election Data Analysis & Visualization - 2019
-- Google BigQuery SQL Queries 

-- 1. Retrieve election results with party details
SELECT
    a.State,
    a.Candidate_Name,
    a.Sex,
    p.Party_Name,
    a.Votes,
    a.Margin_Percentage
FROM
    `your_project.your_dataset.all_states_ge` AS a
JOIN
    `your_project.your_dataset.ge_parties` AS p
ON
    a.Party_ID = p.Party_ID
WHERE
    a.Year = 2019;

-- 2. Top 10 candidates by votes
SELECT
    Candidate_Name,
    State,
    Votes
FROM
    `your_project.your_dataset.all_states_ge`
WHERE
    Year = 2019
ORDER BY Votes DESC
LIMIT 10;

-- 3. Party-wise total votes
SELECT
    p.Party_Name,
    SUM(a.Votes) AS Total_Votes
FROM
    `your_project.your_dataset.all_states_ge` AS a
JOIN
    `your_project.your_dataset.ge_parties` AS p
ON
    a.Party_ID = p.Party_ID
WHERE
    a.Year = 2019
GROUP BY p.Party_Name
ORDER BY Total_Votes DESC;

-- 4. State-wise average winning margin
SELECT
    State,
    AVG(Margin_Percentage) AS Avg_Margin
FROM
    `your_project.your_dataset.all_states_ge`
WHERE
    Year = 2019
GROUP BY State
ORDER BY Avg_Margin DESC;

-- 5. Male vs Female candidates
SELECT
    Sex,
    COUNT(*) AS Candidate_Count
FROM
    `your_project.your_dataset.all_states_ge`
WHERE
    Year = 2019
GROUP BY Sex;
