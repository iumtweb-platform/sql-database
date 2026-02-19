CREATE TABLE person (
    id integer PRIMARY KEY,
    url text NOT NULL,
    website_url text,
    image_url text,
    name varchar(255),
    given_name varchar(255),
    family_name varchar(255),
    birthday date,
    favorites integer NOT NULL,
    city varchar(255) NOT NULL,
    country_id integer NOT NULL,
    CONSTRAINT fk_person_country FOREIGN KEY (country_id) REFERENCES country (id)
);