USE movie_rental;

/* Weekly sales report */
CALL weekly_report(CURRENT_DATE());

/* Oscar films (by actors) quantity per office */
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

/* Offices with more than thee action films */
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
HAVING COUNT(DISTINCT f.id) > 3;

/* Max rated film per office in stock */
SELECT o.id ID, o.name Office, f.name Film, AVG(r.rating) Rating
FROM office o
    INNER JOIN copy c
        ON o.id = c.office_id
    INNER JOIN film f
        ON c.film_id = f.id
    INNER JOIN rating r
        ON f.id = r.film_id
WHERE c.stock > 0
GROUP BY o.id, f.id
HAVING AVG(r.rating) = (
    SELECT MAX(films_avg.rating)
    FROM (SELECT f2.id, AVG(r2.rating) rating
          FROM film f2
              INNER JOIN rating r2
                  ON f2.id = r2.film_id
          GROUP BY f2.id) films_avg
        INNER JOIN copy c2
            ON films_avg.id = c2.film_id
    WHERE c2.office_id = o.id
      AND c2.stock > 0);

/* Films which in stock min in 2 offices */
SELECT f.name, COUNT(DISTINCT o.id) Offices
FROM film f
    INNER JOIN copy c
        ON f.id = c.film_id
    INNER JOIN office o
        ON c.office_id = o.id
WHERE c.stock > 0
GROUP BY f.id
HAVING COUNT(DISTINCT o.id) >= 2;

/* Premium for employees with more than 5 month sales */
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

/* Fine for office heads which have invalid deals this month */
SELECT CONCAT(p.first_name, ' ', p.last_name) head_name,
       (SELECT name FROM office WHERE office_head_id = e.id) office_name,
       e.salary,
       COUNT(DISTINCT d.id) not_returned,
       (COUNT(DISTINCT d.id) * 5) fine,
       (e.salary - (COUNT(DISTINCT d.id) * 5)) difference
FROM employee e
    INNER JOIN person p
        ON e.person_id = p.id
    INNER JOIN office o
        ON e.id = o.office_head_id
    INNER JOIN deal d
        ON d.office_id = o.id
WHERE MONTH(d.start_date) = MONTH(CURRENT_DATE())
  AND IFNULL(d.end_date, CURRENT_DATE()) > d.valid_until_date
GROUP BY e.id
HAVING COUNT(DISTINCT d.id) >= 1;
