-- Часть 1

SELECT
	s.first_name,
	s.last_name,
	s.salary,
	s.industry,
	max_sal.first_name AS name_highest_sal
FROM
	"window".salary s
JOIN (
	SELECT
		industry,
		MAX(salary) AS max_salary -- Колонка макс. зарплаты в отрасли
	FROM
		"window".salary
	GROUP BY
		industry
) AS max_sal_data ON
	s.industry = max_sal_data.industry
JOIN "window".salary max_sal ON -- имя сотрудника с зарплатой = макс. зарплате в отрасли
	max_sal_data.industry = max_sal.industry
	AND max_sal_data.max_salary = max_sal.salary;


SELECT
	s.first_name,
	s.last_name,
	s.salary,
	s.industry,
	max_sal.first_name AS name_highest_sal
FROM
	"window".salary s
JOIN (
	SELECT
		industry,
		MIN(salary) AS min_salary -- Колонка мин. зарплаты в отрасли
	FROM
		"window".salary
	GROUP BY
		industry
) AS max_sal_data ON
	s.industry = max_sal_data.industry
JOIN "window".salary max_sal ON -- имя сотрудника с зарплатой = макс. зарплате в отрасли
	max_sal_data.industry = max_sal.industry
	AND max_sal_data.max_salary = max_sal.salary;


SELECT
	s.first_name,
	s.last_name,
	s.salary,
	s.industry,
	FIRST_VALUE(first_name) OVER (PARTITION BY industry ORDER BY salary DESC) AS max_sal_name
FROM
	"window".salary s

SELECT
	s.first_name,
	s.last_name,
	s.salary,
	s.industry,
	FIRST_VALUE(first_name) OVER (PARTITION BY industry ORDER BY salary) AS min_sal_name
FROM
	"window".salary s
