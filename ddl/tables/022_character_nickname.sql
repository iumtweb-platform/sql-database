CREATE TABLE character_nickname (
    character_id integer NOT NULL,
    nickname varchar(255) NOT NULL,
    PRIMARY KEY (character_id, nickname),
    CONSTRAINT fk_character_nickname_character FOREIGN KEY (character_id) REFERENCES character (id)
);