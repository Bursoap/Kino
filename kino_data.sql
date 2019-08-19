USE movie_rental;

INSERT INTO country (name)
VALUES
    ('USA'),
    ('Germany'),
    ('Russia'),
    ('Spain'),
    ('India');

# film studios
INSERT INTO location (country_id, state, city)
VALUES (1, 'California', 'Los Angeles');
INSERT INTO location (country_id, city)
VALUES
    (2, 'Berlin'),
    (3, 'Moscow'),
    (4, 'Madrid'),
    (5, 'Deli');


# office locations
INSERT INTO location (country_id, state, city, street, number)
VALUES
    (1, 'California', 'San Francisco', 'Clement Street', '3A'),
    (1, 'Illinois', 'Chicago', 'Jefferson Street', '815'),
    (1, 'Colorado', 'Denver', 'Sherman Street', '1660');

# office
INSERT INTO office (location_id, name)
VALUES
    (6, 'California Head Office'),
    (7, 'Chicago Office'),
    (8, 'Denver Office');

# departments
INSERT INTO department (name)
VALUES
    ('Head'),
    ('Management'),
    ('Sales');

# office_departments
INSERT INTO office_department (office_id, dept_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 2),
    (2, 3),
    (3, 2),
    (3, 3);

# Employee locations
INSERT INTO location (country_id, state, city, street, number)
VALUES
    (1, 'California', 'San Francisco', 'Irving St', '4725'),
    (1, 'California', 'San Francisco', 'Lincoln Way', '4433'),
    (1, 'California', 'San Francisco', 'Lawton St', '3721'),
    (1, 'California', 'San Francisco', 'Mogara St', '3633'),
    (1, 'Illinois', 'Chicago', 'Kedvale Ave', '1054'),
    (1, 'Illinois', 'Chicago', 'Oak Ave', '10604'),
    (1, 'Illinois', 'Chicago', 'Wadswords Ave', '1045'),
    (1, 'Colorado', 'Denver', 'Warren Ave', '7351'),
    (1, 'Colorado', 'Denver', 'Eagle St', '5510 W'),
    (1, 'Colorado', 'Denver', 'Dayton St', '630 S');

# persons for employees
INSERT INTO person (location_id, first_name, last_name, birth_date)
VALUES
    (9, 'Jeremy', 'Smith', '1970-01-02'),
    (10, 'Andrew', 'Walker', '1989-05-16'),
    (11, 'Sara', 'Connor', '1990-03-26'),
    (12, 'John', 'Dale', '1987-06-07'),
    (13, 'Dean', 'Winchester', '1983-08-01'),
    (14, 'David', 'Larson', '1991-09-15'),
    (15, 'Jay', 'Carter', '1988-10-14'),
    (16, 'Benjamin', 'Pickle', '1978-03-22'),
    (17, 'Jordan', 'Heinz', '1992-03-08'),
    (18, 'Jessica', 'Flower', '1993-05-09');

# employee
INSERT INTO employee (person_id, office_id, dept_id, title, salary, employment_date)
VALUES
    (1, 1, 1, 'Boss', 5000.00, '1994-02-01'),
    (2, 1, 2, 'Manager', 3000.00, '2004-05-07'),
    (3, 1, 3, 'Seller', 2000.00, '2008-09-16'),
    (4, 1, 3, 'Seller', 2000.00, '2009-11-06'),
    (5, 2, 2, 'Manager', 3000.00, '2005-04-15'),
    (6, 2, 3, 'Seller', 2000.00, '2008-10-07'),
    (7, 2, 3, 'Seller', 2000.00, '2009-08-23'),
    (8, 3, 2, 'Manager', 3000.00, '2009-12-11'),
    (9, 3, 3, 'Seller', 2000.00, '2010-05-17'),
    (10, 3, 3, 'Seller', 2000.00, '2011-07-27');

# Set office heads
UPDATE office SET office_head_id = 2
WHERE office.name = 'California Head Office';

UPDATE office SET office_head_id = 5
WHERE office.name = 'Chicago Office';

UPDATE office SET office_head_id = 8
WHERE office.name = 'Denver Office';

# Client locations
INSERT INTO location (country_id, state, city, street, number)
VALUES
    (1, 'California', 'San Francisco', 'Holy Ave', '214'),
    (1, 'California', 'San Francisco', 'Eddy St', '216'),
    (1, 'California', 'San Francisco', 'Westborough Blvd', '222'),
    (1, 'California', 'San Francisco', 'Barrington St', '114'),
    (1, 'California', 'San Francisco', 'Greendale St', '13A'),
    (1, 'California', 'San Francisco', 'Rey St', '123'),
    (1, 'California', 'San Francisco', '25th St', '1845'),
    (1, 'California', 'San Francisco', 'Baden Ave', '851'),
    (1, 'California', 'San Francisco', 'Grand Ave', '669'),
    (1, 'California', 'San Francisco', 'Dakota St', '68'),
    (1, 'Illinois', 'Chicago', 'Marshall Ave', '6161'),
    (1, 'Illinois', 'Chicago', 'Oconnell St', '43A'),
    (1, 'Illinois', 'Chicago', 'Campbell Ave', '56'),
    (1, 'Illinois', 'Chicago', 'Jackson St', '1440'),
    (1, 'Illinois', 'Chicago', 'Dickey Ave', '6'),
    (1, 'Illinois', 'Chicago', 'Victoria Ave', '1638'),
    (1, 'Illinois', 'Chicago', 'Adams St', '1026'),
    (1, 'Illinois', 'Chicago', 'Park Ave', '67B'),
    (1, 'Illinois', 'Chicago', 'Washington St', '17'),
    (1, 'Illinois', 'Chicago', 'Wadswords Ave', '124'),
    (1, 'Colorado', 'Denver', 'Rebecca Ln', '421'),
    (1, 'Colorado', 'Denver', 'Colorado Blvd', '211'),
    (1, 'Colorado', 'Denver', 'Lincoln St', '712'),
    (1, 'Colorado', 'Denver', 'Warren Ave', '12'),
    (1, 'Colorado', 'Denver', 'Eagle St', '344'),
    (1, 'Colorado', 'Denver', 'Dayton St', '6455'),
    (1, 'Colorado', 'Denver', 'Main St', '7543'),
    (1, 'Colorado', 'Denver', 'Hill Rd', '240N'),
    (1, 'Colorado', 'Denver', 'Mountain St', '23'),
    (1, 'Colorado', 'Denver', '4th St', '200');

# persons for clients
INSERT INTO person (location_id, first_name, last_name, birth_date)
VALUES
    (19, 'John', 'Boil', '1971-12-03'),
    (20, 'Robert', 'Pops', '1979-03-25'),
    (21, 'Wayne', 'Duke', '1981-06-13'),
    (22, 'Patrick', 'Jane', '1983-07-16'),
    (23, 'Lisa', 'Sweat', '1985-08-21'),
    (24, 'Mark', 'Miles', '1984-06-21'),
    (25, 'Holly', 'Carter', '1988-11-24'),
    (26, 'Samuel', 'Cox', '1986-04-26'),
    (27, 'Jay', 'Boon', '1988-01-08'),
    (28, 'Jessica', 'Parker', '1989-10-05'),
    (29, 'Riddle', 'Autumn', '1979-11-22'),
    (30, 'Raymond', 'Monique', '1980-07-26'),
    (31, 'Harris', 'Cora', '1981-08-16'),
    (32, 'Deleon', 'Winston', '1985-07-07'),
    (33, 'Sidney', 'Sullivan', '1982-11-01'),
    (34, 'Ronnie', 'Singer', '1985-09-25'),
    (35, 'Amelie', 'Tucker', '1987-10-13'),
    (36, 'Joey', 'Sawyer', '1988-04-22'),
    (37, 'Roman', 'Kline', '1990-05-28'),
    (38, 'Valencia', 'Cane', '1989-02-09'),
    (39, 'Clara', 'Summer', '1975-03-12'),
    (40, 'Jessica', 'Moreno', '1979-06-26'),
    (41, 'James', 'Cooke', '1981-09-07'),
    (42, 'Ian', 'Oneal', '1982-11-27'),
    (43, 'Victoria', 'Davies', '1983-12-02'),
    (44, 'Jenny', 'Rubio', '1984-06-15'),
    (45, 'Alan', 'Richards', '1985-08-18'),
    (46, 'Maia', 'Green', '1989-05-22'),
    (47, 'Jacob', 'Oscar', '1990-11-01'),
    (48, 'Daniel', 'Colt', '1983-01-28');

# Clients
INSERT INTO client (person_id, email, active)
VALUES
    (11, 'client_1_rental@mail.ru', true),
    (12, 'client_2_rental@mail.ru', true),
    (13, 'client_3_rental@mail.ru', true),
    (14, 'client_4_rental@mail.ru', true),
    (15, 'client_5_rental@mail.ru', true),
    (16, 'client_6_rental@mail.ru', true),
    (17, 'client_7_rental@mail.ru', true),
    (18, 'client_8_rental@mail.ru', true),
    (19, 'client_9_rental@mail.ru', true),
    (20, 'client_10_rental@mail.ru', true),
    (21, 'client_11_rental@mail.ru', true),
    (22, 'client_12_rental@mail.ru', true),
    (23, 'client_13_rental@mail.ru', true),
    (24, 'client_14_rental@mail.ru', true),
    (25, 'client_15_rental@mail.ru', true),
    (26, 'client_16_rental@mail.ru', true),
    (27, 'client_17_rental@mail.ru', true),
    (28, 'client_18_rental@mail.ru', true),
    (29, 'client_19_rental@mail.ru', true),
    (30, 'client_20_rental@mail.ru', true),
    (31, 'client_21_rental@mail.ru', true),
    (32, 'client_22_rental@mail.ru', true),
    (33, 'client_23_rental@mail.ru', true),
    (34, 'client_24_rental@mail.ru', true),
    (35, 'client_25_rental@mail.ru', true),
    (36, 'client_26_rental@mail.ru', true),
    (37, 'client_27_rental@mail.ru', true),
    (38, 'client_28_rental@mail.ru', true),
    (39, 'client_29_rental@mail.ru', true),
    (40, 'client_30_rental@mail.ru', true);

INSERT INTO person (first_name, last_name, birth_date)
VALUES
    ('Tim', 'Roth', '1961-05-14'),
    ('Samuel Leroy', 'Jackson', '1948-12-21'),
    ('Walter Bruce', 'Willis', '1955-03-19'),
    ('Arnold Alois', 'Schwarzenegger', '1947-07-30'),
    ('Kurt Vogel', 'Russell', '1951-03-17'),
    ('Leonardo Wilhelm', 'DiCaprio', '1974-11-11'),
    ('Thom Jeffrey', 'Hanks', '1956-07-09'),
    ('Rutger Oelsen', 'Hauer', '1944-01-23'),
    ('Mickey', 'Rourke', '1952-09-16'),
    ('Sylvester Enzio', 'Stallone', '1946-06-06');

UPDATE person SET death_date = '2019-07-19' WHERE last_name = 'Hauer';

INSERT INTO actor (person_id, biography, oscar)
VALUES
    (41, 'Tim Roth biography...', FALSE),
    (42, 'Samuel Leroy Jackson biography...', FALSE),
    (43, 'Bruce Willis biography...', FALSE),
    (44, 'Arnold biography...', FALSE),
    (45, 'Kurt Russel biography...', FALSE),
    (46, 'DiCaprio biography...', TRUE),
    (47, 'Tom Hanks biography...', TRUE),
    (48, 'Ruger Hauer biography...', FALSE),
    (49, 'Mickey Rourke biography...', FALSE),
    (50, 'Stallone biography...', FALSE);

INSERT INTO person (first_name, last_name, birth_date)
VALUES
    ('Steven Allan', 'Spielberg', '1946-12-18'),
    ('Quentin Jerome', 'Tarantino', '1963-03-27'),
    ('Christopher Edward', 'Nolan', '1970-07-30'),
    ('James Francis', 'Cameron', '1954-08-16');

INSERT INTO film (producer_id, country_id, name, description, duration, release_date)
VALUES
    (51, 1, 'The Terminal', 'The Terminal description', '2:9:0', '2004-06-09'),
    (52, 1, 'The Hateful Eight', 'The Hateful Eight description', '2:47:0', '2016-01-14'),
    (53, 1, 'Inception', 'Inception description', '2:28:0', '2010-07-22'),
    (54, 1, 'The Terminator', 'The Terminator description', '1:47:0', '1984-10-26'),
    (50, 1, 'The Expendables', 'The Expendables description', '1:47:0', '2010-08-07');

INSERT INTO film_actor (film_id, actor_id)
VALUES
    (1, 7),
    (2, 1),
    (2, 2),
    (2, 5),
    (3, 6),
    (4, 4),
    (5, 3),
    (5, 4),
    (5, 9),
    (5, 10);

INSERT INTO genre (name)
VALUES
    ('Action'),
    ('Adventure'),
    ('Comedy'),
    ('Crime'),
    ('Drama'),
    ('Epics'),
    ('Horror'),
    ('Science fiction'),
    ('Westerns'),
    ('War');

INSERT INTO film_genre (film_id, genre_id)
VALUES
    (1, 3),
    (1, 5),
    (2, 1),
    (2, 4),
    (2, 9),
    (3, 1),
    (3, 8),
    (4, 1),
    (4, 8),
    (5, 1),
    (5, 3),
    (5, 10);

INSERT INTO translation (name)
VALUES
    ('English'),
    ('German'),
    ('Russian'),
    ('Spanish'),
    ('Indian');

INSERT INTO copy (film_id, office_id, translation_id, price, stock)
VALUES
    (1, 1, 1, 12.0, 5),  /* The Terminal */
    (1, 1, 2, 15.0, 1),
    (1, 1, 3, 15.0, 1),
    (1, 2, 1, 10.0, 3),
    (1, 2, 3, 15.0, 1),
    (1, 3, 1, 10.0, 4),
    (1, 3, 4, 15.0, 1),
    (2, 1, 1, 12.0, 5),  /* The Hateful Eight */
    (2, 1, 2, 15.0, 1),
    (2, 1, 3, 15.0, 2),
    (2, 1, 4, 15.0, 1),
    (2, 2, 1, 10.0, 2),
    (2, 2, 5, 20.0, 1),
    (2, 3, 1, 10.0, 3),
    (2, 3, 3, 15.0, 1),
    (3, 1, 1, 10.0, 2),  /* Inception */
    (3, 1, 3, 15.0, 1),
    (3, 2, 1, 10.0, 2),
    (3, 2, 2, 15.0, 1),
    (3, 3, 1, 10.0, 1),
    (3, 3, 5, 15.0, 1),
    (4, 1, 1, 10.0, 3),  /* The Terminator */
    (4, 1, 2, 15.0, 1),
    (4, 1, 3, 15.0, 1),
    (4, 1, 4, 15.0, 1),
    (4, 1, 5, 15.0, 1),
    (4, 2, 1, 10.0, 2),
    (4, 2, 3, 15.0, 1),
    (4, 3, 1, 10.0, 2),
    (4, 3, 2, 15.0, 1),
    (5, 1, 1, 12.0, 5),  /* The Expendables */
    (5, 1, 2, 15.0, 1),
    (5, 1, 3, 15.0, 1),
    (5, 1, 4, 15.0, 1),
    (5, 1, 5, 15.0, 1),
    (5, 2, 1, 12.0, 3),
    (5, 2, 4, 15.0, 1),
    (5, 3, 1, 12.0, 3),
    (5, 3, 2, 15.0, 1),
    (5, 3, 5, 15.0, 1);
