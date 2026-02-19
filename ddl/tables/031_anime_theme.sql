CREATE TABLE anime_theme (
    anime_id integer NOT NULL,
    theme_id integer NOT NULL,
    PRIMARY KEY (anime_id, theme_id),
    CONSTRAINT fk_anime_theme_anime FOREIGN KEY (anime_id) REFERENCES anime (id) ON DELETE CASCADE,
    CONSTRAINT fk_anime_theme_theme FOREIGN KEY (theme_id) REFERENCES theme (id) ON DELETE CASCADE
);