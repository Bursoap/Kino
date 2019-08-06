INSERT INTO country (name) VALUES ('USA');
INSERT INTO country (name) VALUES ('Germany');
INSERT INTO country (name) VALUES ('Russia');
INSERT INTO country (name) VALUES ('Spain');
INSERT INTO country (name) VALUES ('India');

INSERT INTO language (name) VALUES ('English');
INSERT INTO language (name) VALUES ('German');
INSERT INTO language (name) VALUES ('Russian');
INSERT INTO language (name) VALUES ('Spanish');
INSERT INTO language (name) VALUES ('Indian');

# film studios
INSERT INTO location (country_id, state, city)
VALUES (1, 'California', 'Los Angeles');
INSERT INTO location (country_id, city)
VALUES (2, 'Berlin');
INSERT INTO location (country_id, city)
VALUES (3, 'Moscow');
INSERT INTO location (country_id, city)
VALUES (4, 'Madrid');
INSERT INTO location (country_id, city)
VALUES (5, 'Deli');


# office locations
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Clement Street', '3A');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Jefferson Street', '815');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', 'Sherman Street', '1660');

# office
INSERT INTO office (location_id, name)
VALUES (6, 'California Head Office');
INSERT INTO office (location_id, name)
VALUES (7, 'Chicago Office');
INSERT INTO office (location_id, name)
VALUES (8, 'Denver Office');

# departments
INSERT INTO department (name) VALUES ('Head');
INSERT INTO department (name) VALUES ('Management');
INSERT INTO department (name) VALUES ('Sales');

# office_departments
INSERT INTO office_department (office_id, dept_id) VALUES (1, 1);
INSERT INTO office_department (office_id, dept_id) VALUES (1, 2);
INSERT INTO office_department (office_id, dept_id) VALUES (1, 3);

INSERT INTO office_department (office_id, dept_id) VALUES (2, 2);
INSERT INTO office_department (office_id, dept_id) VALUES (2, 3);

INSERT INTO office_department (office_id, dept_id) VALUES (3, 2);
INSERT INTO office_department (office_id, dept_id) VALUES (3, 3);

# Employee locations
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Irving St', '4725');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Lincoln Way', '4433');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Lawton St', '3721');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Mogara St', '3633');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Kedvale Ave', '1054');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Oak Ave', '10604');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Wadswords Ave', '1045');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', 'Warren Ave', '7351');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', 'Eagle St', '5510 W');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', 'Dayton St', '630 S');

# persons for employees
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (9, 'Jeremy', 'Smith', '1970-01-02');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (10, 'Andrew', 'Walker', '1989-05-16');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (11, 'Sara', 'Connor', '1990-03-26');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (12, 'John', 'Dale', '1987-06-07');

INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (13, 'Dean', 'Winchester', '1983-08-01');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (14, 'David', 'Larson', '1991-09-15');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (15, 'Jay', 'Carter', '1988-10-14');

INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (16, 'Benjamin', 'Pickle', '1978-03-22');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (17, 'Jordan', 'Heinz', '1992-03-08');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (18, 'Jessica', 'Flower', '1993-05-09');

# employee
INSERT INTO employee (person_id, office_id, dept_id, superior_id, title, salary, active, start_date)
VALUES (1, 1, 1, NULL, 'Boss', 5000.00, TRUE, '1994-02-01');
INSERT INTO employee (person_id, office_id, dept_id, superior_id, title, salary, active, start_date)
VALUES (2, 1, 2, 1, 'Manager', 3000.00, TRUE, '2004-05-07');
INSERT INTO employee (person_id, office_id, dept_id, superior_id, title, salary, active, start_date)
VALUES (3, 1, 3, 2, 'Seller', 2000.00, TRUE, '2008-09-16');
INSERT INTO employee (person_id, office_id, dept_id, superior_id, title, salary, active, start_date)
VALUES (4, 1, 3, 2, 'Seller', 2000.00, TRUE, '2009-11-06');

INSERT INTO employee (person_id, office_id, dept_id, superior_id, title, salary, active, start_date)
VALUES (5, 2, 2, 1, 'Manager', 3000.00, TRUE, '2005-04-15');
INSERT INTO employee (person_id, office_id, dept_id, superior_id, title, salary, active, start_date)
VALUES (6, 2, 3, 5, 'Seller', 2000.00, TRUE, '2008-10-07');
INSERT INTO employee (person_id, office_id, dept_id, superior_id, title, salary, active, start_date)
VALUES (7, 2, 3, 5, 'Seller', 2000.00, TRUE, '2009-08-23');

INSERT INTO employee (person_id, office_id, dept_id, superior_id, title, salary, active, start_date)
VALUES (8, 3, 2, 1, 'Manager', 3000.00, TRUE, '2009-12-11');
INSERT INTO employee (person_id, office_id, dept_id, superior_id, title, salary, active, start_date)
VALUES (9, 3, 3, 8, 'Seller', 2000.00, TRUE, '2010-05-17');
INSERT INTO employee (person_id, office_id, dept_id, superior_id, title, salary, active, start_date)
VALUES (10, 3, 3, 8, 'Seller', 2000.00, TRUE, '2011-07-27');


# Client locations
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Holy Ave', '214');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Eddy St', '216');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Westborough Blvd', '222');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Barrington St', '114');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Greendale St', '13A');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Rey St', '123');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', '25th St', '1845');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Baden Ave', '851');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Grand Ave', '669');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'California', 'San Francisco', 'Dakota St', '68');

INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Marshall Ave', '6161');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Oconnell St', '43A');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Campbell Ave', '56');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Jackson St', '1440');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Dickey Ave', '6');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Victoria Ave', '1638');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Adams St', '1026');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Park Ave', '67B');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Washington St', '17');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Illinois', 'Chicago', 'Wadswords Ave', '124');

INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', 'Rebecca Ln', '421');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', 'Colorado Blvd', '211');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', 'Lincoln St', '712');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', 'Warren Ave', '12');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', 'Eagle St', '344');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', 'Dayton St', '6455');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', 'Main St', '7543');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', 'Hill Rd', '240N');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', 'Mountain St', '23');
INSERT INTO location (country_id, state, city, street, number)
VALUES (1, 'Colorado', 'Denver', '4th St', '200');

# persons for clients
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (19, 'John', 'Boil', '1971-12-03');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (20, 'Robert', 'Pops', '1979-03-25');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (21, 'Wayne', 'Duke', '1981-06-13');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (22, 'Patrick', 'Jane', '1983-07-16');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (23, 'Lisa', 'Sweat', '1985-08-21');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (24, 'Mark', 'Miles', '1984-06-21');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (25, 'Holly', 'Carter', '1988-11-24');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (26, 'Samuel', 'Cox', '1986-04-26');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (27, 'Jay', 'Boon', '1988-01-08');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (28, 'Jessica', 'Parker', '1989-10-05');

INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (29, 'Riddle', 'Autumn', '1979-11-22');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (30, 'Raymond', 'Monique', '1980-07-26');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (31, 'Harris', 'Cora', '1981-08-16');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (32, 'Deleon', 'Winston', '1985-07-07');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (33, 'Sidney', 'Sullivan', '1982-11-01');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (34, 'Ronnie', 'Singer', '1985-09-25');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (35, 'Amelie', 'Tucker', '1987-10-13');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (36, 'Joey', 'Sawyer', '1988-04-22');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (37, 'Roman', 'Kline', '1990-05-28');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (38, 'Valencia', 'Cane', '1989-02-09');

# persons for clients
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (39, 'Clara', 'Summer', '1975-03-12');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (40, 'Jessica', 'Moreno', '1979-06-26');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (41, 'James', 'Cooke', '1981-09-07');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (42, 'Ian', 'Oneal', '1982-11-27');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (43, 'Victoria', 'Davies', '1983-12-02');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (44, 'Jenny', 'Rubio', '1984-06-15');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (45, 'Alan', 'Richards', '1985-08-18');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (46, 'Maia', 'Green', '1989-05-22');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (47, 'Jacob', 'Oscar', '1990-11-01');
INSERT INTO person (location_id, fname, lname, birth_date)
VALUES (48, 'Daniel', 'Colt', '1983-01-28');




