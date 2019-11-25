SELECT min(sum)
	FROM
		(SELECT sum(total)
			FROM customer
				INNER JOIN employee ON (Salesperson_id = Employee_id)
				INNER JOIN sales_order USING(customer_id)
				INNER JOIN department USING(department_id)
				INNER JOIN location USING(location_id)
			WHERE regional_group = 'NEW YORK'
			GROUP BY employee_id) tab;
