CREATE TABLE anime_studio (
    anime_id integer NOT NULL,
    studio_id integer NOT NULL,
    PRIMARY KEY (anime_id, studio_id),
    CONSTRAINT fk_anime_studio_anime FOREIGN KEY (anime_id) REFERENCES anime (id) ON DELETE CASCADE,
    CONSTRAINT fk_anime_studio_studio FOREIGN KEY (studio_id) REFERENCES studio (id) ON DELETE CASCADE
);