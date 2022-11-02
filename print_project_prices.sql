SELECT p.project_id, SUM(w.salary)*((p.finish_date - p.start_date)/30) AS "PRICE"
FROM project p
INNER JOIN worker w
ON p.project_id = w.project_id
GROUP BY p.project_id
ORDER BY "PRICE" DESC;