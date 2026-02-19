CREATE TABLE person_alternate_name (
    person_id integer NOT NULL,
    alternate_name varchar(255) NOT NULL,
    PRIMARY KEY (person_id, alternate_name),
    CONSTRAINT fk_person_alternate_name_person FOREIGN KEY (person_id) REFERENCES person (id)
);