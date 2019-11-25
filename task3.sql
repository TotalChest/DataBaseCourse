SELECT name, regional_group
	FROM ((job
		INNER JOIN employee USING(job_id))
		INNER JOIN department USING(department_id))
		INNER JOIN location USING(location_id) 
	WHERE department_id IN
		(SELECT department_id
			FROM ((job
				INNER JOIN employee USING(job_id))
				INNER JOIN department USING(department_id))
				INNER JOIN location USING(location_id)
			GROUP BY department_id, function
			HAVING function != 'SALESPERSON') AND (commission IS NOT NULL AND commission >0)
	GROUP BY department_id, name, regional_group;
