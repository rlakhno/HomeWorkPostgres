SELECT project_id AS "Project Name", ((finish_date - start_date)/30) AS "Longest Project In Month"
FROM  project 
WHERE ((finish_date - start_date)/30) =
	(
	SELECT  MAX(duration)
	FROM
		(
		SELECT project_id,((finish_date - start_date)/30)  duration 
		FROM project
		ORDER BY duration DESC
		) AS a
	)
GROUP BY project_id