CREATE TABLE character (
    id integer PRIMARY KEY,
    url text NOT NULL,
    name varchar(255) NOT NULL,
    name_kanji varchar(255),
    image text NOT NULL,
    favorites integer NOT NULL,
    about varchar(5000)
);