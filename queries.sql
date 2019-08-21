USE movie_rental;


CALL weekly_report(CURRENT_DATE());


SELECT o.name Office, COUNT(DISTINCT f.id) Quantity
FROM office o
    INNER JOIN copy c
        ON o.id = c.office_id
    INNER JOIN film f
        ON c.film_id = f.id
    INNER JOIN film_actor fa
        ON f.id = fa.film_id
    INNER JOIN actor a
        ON fa.actor_id = a.id
WHERE a.oscar = TRUE
GROUP BY o.id;


SELECT o.name, COUNT(DISTINCT f.id) Actions
FROM office o
    INNER JOIN copy c
        ON o.id = c.office_id
    INNER JOIN film f
        ON c.film_id = f.id
    INNER JOIN film_genre fg
        ON f.id = fg.film_id
    INNER JOIN genre g
        ON fg.genre_id = g.id
WHERE g.name = 'Action'
GROUP BY o.id
HAVING COUNT(DISTINCT f.id) > 2;


SELECT res.Office, res.Film, res.Rating
FROM (SELECT o.id, o.name Office, f.name Film, AVG(r.rating) Rating
        FROM office o
            INNER JOIN copy c
                ON o.id = c.office_id
            INNER JOIN film f
                ON c.film_id = f.id
            INNER JOIN rating r
                ON f.id = r.film_id
        GROUP BY o.id, f.id
        HAVING AVG(r.rating) = (
            SELECT MAX(films_avg.rating)
            FROM (
                SELECT f2.id, AVG(r2.rating) rating
                FROM film f2 INNER JOIN rating r2
                    ON f2.id = r2.film_id
                GROUP BY f2.id
                ) films_avg
                INNER JOIN copy c2
                    ON films_avg.id = c2.film_id
            WHERE c2.office_id = o.id
            )
    ) res;


SELECT f.name, COUNT(DISTINCT o.id) Offices
FROM film f
    INNER JOIN copy c
        ON f.id = c.film_id
    INNER JOIN office o
        ON c.office_id = o.id
GROUP BY f.id
HAVING COUNT(DISTINCT o.id) >= 2;


SELECT CONCAT(p.first_name, ' ',  p.last_name) employee_name,
       e.title employee_title,
       o.name office_name,
       d.name department_name,
       e.salary,
       e.salary * 0.1 premium
FROM employee e
    INNER JOIN person p
        ON e.person_id = p.id
    INNER JOIN office o
        ON e.office_id = o.id
    INNER JOIN department d
        ON e.dept_id = d.id
WHERE 5 <= (SELECT COUNT(*)
            FROM deal
            WHERE open_emp_id = e.id
              AND MONTH(start_date)=MONTH(CURRENT_DATE()));


SELECT CONCAT(p.first_name, ' ', p.last_name) head_name,
       o.name office_name,
       e.salary,
       COUNT(DISTINCT d.id) not_returned,
       (5 * not_returned) fine,
       (e.salary - fine) difference
FROM office o
    INNER JOIN employee e
        ON o.office_head_id = e.office_id
    INNER JOIN person p
        ON e.person_id = p.id
    INNER JOIN deal d
        ON o.id = d.office_id
WHERE MONTH(d.start_date) = MONTH(CURRENT_DATE())
  AND IFNULL(d.end_date, CURRENT_DATE()) > valid_until_date
GROUP BY e.id
HAVING COUNT(DISTINCT d.id) >= 1;
