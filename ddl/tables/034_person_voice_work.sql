CREATE TABLE person_voice_work (
    person_id integer NOT NULL,
    anime_id integer NOT NULL,
    character_id integer NOT NULL,
    language_id integer NOT NULL,
    PRIMARY KEY (person_id, anime_id, character_id, language_id),
    CONSTRAINT fk_person_voice_work_person FOREIGN KEY (person_id) REFERENCES person (id) ON DELETE CASCADE,
    CONSTRAINT fk_person_voice_work_anime FOREIGN KEY (anime_id) REFERENCES anime (id) ON DELETE CASCADE,
    CONSTRAINT fk_person_voice_work_character FOREIGN KEY (character_id) REFERENCES character (id) ON DELETE CASCADE,
    CONSTRAINT fk_person_voice_work_language FOREIGN KEY (language_id) REFERENCES language (id) ON DELETE CASCADE
);