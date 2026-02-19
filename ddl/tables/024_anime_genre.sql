CREATE TABLE anime_genre (
    anime_id integer NOT NULL,
    genre_id integer NOT NULL,
    PRIMARY KEY (anime_id, genre_id),
    CONSTRAINT fk_anime_genre_anime FOREIGN KEY (anime_id) REFERENCES anime (id) ON DELETE CASCADE,
    CONSTRAINT fk_anime_genre_genre FOREIGN KEY (genre_id) REFERENCES genre (id) ON DELETE CASCADE
);