CREATE TABLE character_anime_work (
    anime_id integer NOT NULL,
    character_id integer NOT NULL,
    character_role_id integer NOT NULL,
    PRIMARY KEY (anime_id, character_id),
    CONSTRAINT fk_character_anime_work_anime FOREIGN KEY (anime_id) REFERENCES anime (id) ON DELETE CASCADE,
    CONSTRAINT fk_character_anime_work_character FOREIGN KEY (character_id) REFERENCES character (id) ON DELETE CASCADE,
    CONSTRAINT fk_character_anime_work_role FOREIGN KEY (character_role_id) REFERENCES character_role (id) ON DELETE CASCADE
);