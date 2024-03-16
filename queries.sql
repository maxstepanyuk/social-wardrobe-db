--postgresql


-- 1. + простий запит на вибірку з однієї таблиці;
SELECT
	*
FROM
	outfits o 
;

-- -- 2. простий запит на вибірку з декількох таблиць
-- users and their gender (from profile.gender_id and gender.name)

SELECT
	u.user_id id,
	u.username,
	p.biography,
	p.birthdate,
	g.name AS gender
FROM
	"user" u
JOIN "profile" p 
	ON
	u.user_id = p.user_id
JOIN "gender" g 
	ON
	p.gender_id = g.gender_id
ORDER BY
	u.user_id 
;

-- всі образи разом з усіма предметами одягу
SELECT 
	outfits.outfit_id, 
	outfits.name, 
	garment.garment_id, 
	gt.name
FROM
	outfits
JOIN garments_outfits 
	ON
	outfits.outfit_id = garments_outfits.outfit_id
JOIN garment 
	ON
	garments_outfits.garment_id = garment .garment_id
JOIN garment_type gt 
	ON
	garment .garment_type_id = gt.garment_type_id
;



-- -- 3. запит з групуванням;

-- кількості відгуків на кожний образ

SELECT
	o.outfit_id,
	o."name" AS "outfit name",
	COUNT(c.comment_id) AS total_comments
FROM
	outfits o
JOIN "comments" as c ON
	o.outfit_id = c.outfit_id
GROUP BY
	o.outfit_id
ORDER BY total_comments DESC 
;


-- -- 4. запит з обчислювальним полем;
-- підрахунок віку користувачів на основі їхніх дат народження
-- функція AGE - різниця між двома датами
SELECT
	p.user_id ,
	p.birthdate,
	AGE(CURRENT_DATE, p.birthdate) AS age
FROM
	profile p 
ORDER
	BY birthdate DESC 
;

-- показати тільки роки
SELECT
	user_id ,
	DATE_PART('year', AGE(CURRENT_DATE, p.birthdate)) AS age
FROM
	profile p 
;

-- -- 5. запит з використанням агрегатних функцій;
-- знаходження середньої оцінки для кожного образу

SELECT
	outfit_id,
	AVG(rating) AS avg_rating
FROM
	ratings
GROUP BY
	outfit_id
ORDER BY avg_rating DESC 
;

-- 6. запит з сортуванням;

SELECT
	user_id,
	username,
	registration_date
FROM
	"user" u
ORDER BY
	u.registration_date 
;

SELECT
	outfit_id ,
	"name" ,
	date_created ,
	date_worn
FROM
	outfits
ORDER BY
	date_worn DESC
;


-- 7. запит з використанням умови;

SELECT
	o.outfit_id ,
	o."name" ,
	o.date_worn
FROM
	outfits o
WHERE
	AGE('2024-03-02'::date ,
	date_worn) <= '50 days'
;


SELECT
	o.outfit_id ,
	o."name" ,
	o.date_worn,
	AGE(CURRENT_DATE,
	date_worn) AS ago
FROM
	outfits o
WHERE
	AGE(CURRENT_DATE,
	date_worn) <= '50 days'
;



-- 8. запит з використанням підзапитів.

-- вибірка образів, які містять певну категорію одягу

SELECT
	*
FROM
	outfits
WHERE
	outfit_id 
IN 
(
	SELECT
		outfit_id
	FROM
		garments_outfits
	WHERE
		garment_id 
	IN 
	(
		SELECT
			garment_id
		FROM
			garment
		WHERE
			garment_type_id 
		IN (
			SELECT
				garment_type_id
			FROM
				garment_type gt
			WHERE 
				gt."name" = 'Shirt'
		)
	)
)
;






-- list all DBs
SELECT datname FROM pg_database; 


-- list all tables brom this db
SELECT
	table_name
FROM
	information_schema.tables
WHERE
	table_schema = 'public'
	AND table_type = 'BASE TABLE';





-- column information from a table
SELECT
	column_name,
	data_type,
	column_default ,
	is_nullable ,
	udt_name
FROM
	information_schema.columns
WHERE
	table_name = 'comments'
;
