SELECT list_price
	FROM product INNER JOIN price USING(product_id)
	WHERE (end_date IS NULL OR end_date > NOW()) AND description LIKE '%WIFF SOFTBALL%';
