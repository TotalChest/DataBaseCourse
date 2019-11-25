SELECT name, regional_group, count(*)
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
			GROUP BY  department_id,function
			HAVING function = 'ANALYST')
	GROUP BY function, department_id, regional_group,name
	HAVING function = 'ANALYST';
