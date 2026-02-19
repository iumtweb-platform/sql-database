CREATE TABLE anime_explicit_genre (
    anime_id integer NOT NULL,
    explicit_genre_id integer NOT NULL,
    PRIMARY KEY (anime_id, explicit_genre_id),
    CONSTRAINT fk_anime_explicit_genre_anime FOREIGN KEY (anime_id) REFERENCES anime (id) ON DELETE CASCADE,
    CONSTRAINT fk_anime_explicit_genre_explicit_genre FOREIGN KEY (explicit_genre_id) REFERENCES explicit_genre (id) ON DELETE CASCADE
);