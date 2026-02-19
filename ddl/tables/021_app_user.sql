CREATE TABLE app_user (
    id integer PRIMARY KEY,
    gender_id integer,
    country_id integer NOT NULL,
    birthday date,
    joined_date date NOT NULL,
    username varchar(255) NOT NULL,
    CONSTRAINT fk_app_user_gender FOREIGN KEY (gender_id) REFERENCES gender (id),
    CONSTRAINT fk_app_user_country FOREIGN KEY (country_id) REFERENCES country (id)
);