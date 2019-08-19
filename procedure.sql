USE movie_rental;

DELIMITER //

CREATE PROCEDURE weekly_report(IN request_date DATE)
    BEGIN
        SELECT office.name Office,
            SUM(CASE
                    WHEN WEEKDAY(d.start_date) = 0 THEN 1
                    ELSE 0
                END) Mon,
            SUM(CASE
                    WHEN WEEKDAY(d.start_date) = 1 THEN 1
                    ELSE 0
                END) Tue,
            SUM(CASE
                    WHEN WEEKDAY(d.start_date) = 2 THEN 1
                    ELSE 0
                END) Wed,
            SUM(CASE
                    WHEN WEEKDAY(d.start_date) = 3 THEN 1
                    ELSE 0
                END) Thu,
            SUM(CASE
                    WHEN WEEKDAY(d.start_date) = 4 THEN 1
                    ELSE 0
                END) Fri,
            SUM(CASE
                    WHEN WEEKDAY(d.start_date) = 5 THEN 1
                    ELSE 0
                END) Sat,
            SUM(CASE
                    WHEN WEEKDAY(d.start_date) = 6 THEN 1
                    ELSE 0
                END) Sun,
            COUNT(*) Total
        FROM office INNER JOIN deal d ON office.id = d.office_id
        WHERE YEARWEEK(d.start_date) = YEARWEEK(request_date)
        GROUP BY office.id, WEEKDAY(d.start_date);
    END //

DELIMITER ;
