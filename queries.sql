-- 1. Total Candidates
SELECT COUNT(DISTINCT candidate) AS total_candidates
FROM election_results;

-- 2. Total Parties
SELECT COUNT(DISTINCT party) AS total_parties
FROM election_results;

-- 3. Top 10 Constituencies by Votes
SELECT constituency, SUM(votes) AS total_votes
FROM election_results
GROUP BY constituency
ORDER BY total_votes DESC
LIMIT 10;

-- 4. Winning Candidates
SELECT candidate, party, constituency
FROM election_results
WHERE is_winner = 1;

-- 5. Party Wise Candidate Count
SELECT party, COUNT(candidate) AS candidate_count
FROM election_results
GROUP BY party
ORDER BY candidate_count DESC;

-- 6. Average Votes by Party
SELECT party, AVG(votes) AS avg_votes
FROM election_results
GROUP BY party
ORDER BY avg_votes DESC;

-- 7. Constituencies Won by Each Party
SELECT party, COUNT(*) AS seats_won
FROM election_results
WHERE is_winner = 1
GROUP BY party
ORDER BY seats_won DESC;

-- 8. Candidate with Lowest Votes
SELECT candidate, party, votes
FROM election_results
ORDER BY votes ASC
LIMIT 1;

-- 9. Top 5 Parties by Vote Share
SELECT party,
       ROUND(SUM(votes) * 100.0 /
       (SELECT SUM(votes) FROM election_results), 2) AS vote_share
FROM election_results
GROUP BY party
ORDER BY vote_share DESC
LIMIT 5;

-- 10. State-wise Winning Candidates
SELECT state, COUNT(*) AS winners
FROM election_results
WHERE is_winner = 1
GROUP BY state
ORDER BY winners DESC;
