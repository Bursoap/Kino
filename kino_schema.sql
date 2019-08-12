CREATE DATABASE movie_rental;

USE movie_rental;

CREATE TABLE country (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_country PRIMARY KEY (id)
);

CREATE TABLE location (
    id INT UNSIGNED AUTO_INCREMENT,
    country_id INT UNSIGNED NOT NULL,
    state VARCHAR(100),
    city VARCHAR(100),
    street VARCHAR(100),
    number VARCHAR(100),
    CONSTRAINT pk_location PRIMARY KEY (id),
    CONSTRAINT fk_location_country FOREIGN KEY (country_id) REFERENCES country (id)
);

CREATE TABLE office (
    id INT UNSIGNED AUTO_INCREMENT,
    location_id INT UNSIGNED NOT NULL,
    office_head_id INT UNSIGNED,
    name VARCHAR(100),
    CONSTRAINT pk_office PRIMARY KEY (id),
    CONSTRAINT fk_location_office FOREIGN KEY (location_id) REFERENCES location (id)
);

CREATE TABLE department (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT pk_office PRIMARY KEY (id),
    CONSTRAINT unique_dept_name UNIQUE (name)
);

CREATE TABLE office_department (
    office_id INT UNSIGNED NOT NULL,
    dept_id INT UNSIGNED NOT NULL,
    CONSTRAINT pk_office_dept PRIMARY KEY (office_id, dept_id),
    CONSTRAINT fk_office_office_dept FOREIGN KEY (office_id) REFERENCES office (id),
    CONSTRAINT fk_department_office_dept FOREIGN KEY (dept_id) REFERENCES department (id)
);

CREATE TABLE person (
    id INT UNSIGNED AUTO_INCREMENT,
    location_id INT UNSIGNED,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    death_date DATE,
    CONSTRAINT pk_person PRIMARY KEY (id),
    CONSTRAINT fk_location_person FOREIGN KEY (location_id) REFERENCES location (id)
);

CREATE TABLE client (
    id INT UNSIGNED AUTO_INCREMENT,
    person_id INT UNSIGNED NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(100),
    active BOOLEAN NOT NULL,
    CONSTRAINT pk_client PRIMARY KEY (id),
    CONSTRAINT fk_person_client FOREIGN KEY (person_id) REFERENCES person (id),
    CONSTRAINT unique_person_client UNIQUE (person_id)
);

CREATE TABLE actor (
    id INT UNSIGNED AUTO_INCREMENT,
    person_id INT UNSIGNED NOT NULL,
    biography TEXT,
    oscar BOOLEAN NOT NULL,
    CONSTRAINT pk_actor PRIMARY KEY (id),
    CONSTRAINT fk_person_actor FOREIGN KEY (person_id) REFERENCES person (id),
    CONSTRAINT unique_person_actor UNIQUE (person_id)
);

CREATE TABLE employee (
    id INT UNSIGNED AUTO_INCREMENT,
    person_id INT UNSIGNED NOT NULL,
    office_id INT UNSIGNED NOT NULL,
    dept_id INT UNSIGNED NOT NULL,
    title VARCHAR(100) NOT NULL,
    salary DOUBLE(8, 2) NOT NULL,
    active BOOLEAN NOT NULL,
    employment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    dismiss_date DATE,
    CONSTRAINT pk_employee PRIMARY KEY (id),
    CONSTRAINT fk_person_employee FOREIGN KEY (person_id) REFERENCES person (id),
    CONSTRAINT fk_office_employee FOREIGN KEY (office_id) REFERENCES office (id),
    CONSTRAINT fk_department_employee FOREIGN KEY (dept_id) REFERENCES department (id),
    CONSTRAINT unique_person_employee UNIQUE (person_id)
);

ALTER TABLE office
    ADD CONSTRAINT fk_employee_office_head FOREIGN KEY (office_head_id) REFERENCES employee (id);

CREATE TABLE genre (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50),
    CONSTRAINT pk_genre PRIMARY KEY (id),
    CONSTRAINT unique_genre_name UNIQUE (name)
);

CREATE TABLE film (
    id INT UNSIGNED AUTO_INCREMENT,
    producer_id INT UNSIGNED NOT NULL,
    country_id INT UNSIGNED NOT NULL,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    duration TIME NOT NULL,
    release_date DATE NOT NULL,
    CONSTRAINT pk_film PRIMARY KEY (id),
    CONSTRAINT fk_person_film FOREIGN KEY (producer_id) REFERENCES person (id),
    CONSTRAINT fk_country_film FOREIGN KEY (country_id) REFERENCES country (id)
);

CREATE TABLE film_genre (
    film_id INT UNSIGNED NOT NULL,
    genre_id INT UNSIGNED NOT NULL,
    CONSTRAINT pk_film_genre PRIMARY KEY (film_id, genre_id),
    CONSTRAINT fk_film_film_genre FOREIGN KEY (film_id) REFERENCES film (id),
    CONSTRAINT fk_genre_film_genre FOREIGN KEY (genre_id) REFERENCES genre (id)
);

CREATE TABLE film_actor (
    film_id INT UNSIGNED NOT NULL,
    actor_id INT UNSIGNED NOT NULL,
    CONSTRAINT pk_film_actor PRIMARY KEY (film_id, actor_id),
    CONSTRAINT fk_film_film_actor FOREIGN KEY (film_id) REFERENCES film (id),
    CONSTRAINT fk_actor_film_actor FOREIGN KEY (actor_id) REFERENCES actor (id)
);

CREATE TABLE rating (
    film_id INT UNSIGNED NOT NULL,
    client_id INT UNSIGNED NOT NULL,
    rating DOUBLE(2, 1) NOT NULL,
    CONSTRAINT pk_rating PRIMARY KEY (film_id, client_id),
    CONSTRAINT fk_film_rating FOREIGN KEY (film_id) REFERENCES film (id),
    CONSTRAINT fk_client_rating FOREIGN KEY (client_id) REFERENCES client (id)
);

CREATE TABLE translation (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    CONSTRAINT pk_translation PRIMARY KEY (id),
    CONSTRAINT unique_translation_name UNIQUE (name)
);

CREATE TABLE copy (
    id INT UNSIGNED AUTO_INCREMENT,
    film_id INT UNSIGNED NOT NULL,
    office_id INT UNSIGNED NOT NULL,
    translation_id INT UNSIGNED NOT NULL,
    price DOUBLE(4, 2) NOT NULL,
    stock INT UNSIGNED NOT NULL,
    CONSTRAINT pk_copy PRIMARY KEY (id),
    CONSTRAINT fk_film_copy FOREIGN KEY (film_id) REFERENCES film (id),
    CONSTRAINT fk_office_copy FOREIGN KEY (office_id) REFERENCES office (id),
    CONSTRAINT fk_translation_copy FOREIGN KEY (translation_id) REFERENCES translation (id),
    CONSTRAINT unique_film_office_translation UNIQUE (film_id, office_id, translation_id)
);

CREATE TABLE deal (
    id INT UNSIGNED AUTO_INCREMENT,
    client_id INT UNSIGNED NOT NULL,
    office_id INT UNSIGNED NOT NULL,
    open_emp_id INT UNSIGNED NOT NULL,
    total_earnings DOUBLE(8, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    CONSTRAINT pk_deal PRIMARY KEY (id),
    CONSTRAINT fk_client_deal FOREIGN KEY (client_id) REFERENCES client (id),
    CONSTRAINT fk_office_deal FOREIGN KEY (office_id) REFERENCES office (id),
    CONSTRAINT fk_employee_deal FOREIGN KEY (open_emp_id) REFERENCES employee (id)
);

CREATE TABLE deal_copy (
    deal_id INT UNSIGNED NOT NULL,
    copy_id INT UNSIGNED NOT NULL,
    CONSTRAINT pk_deal_copy PRIMARY KEY (deal_id, copy_id),
    CONSTRAINT fk_deal_deal_copy FOREIGN KEY (deal_id) REFERENCES deal (id),
    CONSTRAINT fk_copy_deal_copy FOREIGN KEY (copy_id) REFERENCES copy (id)
);
