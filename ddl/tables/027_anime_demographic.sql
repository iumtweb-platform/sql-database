CREATE TABLE anime_demographic (
    anime_id integer NOT NULL,
    demographic_id integer NOT NULL,
    PRIMARY KEY (anime_id, demographic_id),
    CONSTRAINT fk_anime_demographic_anime FOREIGN KEY (anime_id) REFERENCES anime (id) ON DELETE CASCADE,
    CONSTRAINT fk_anime_demographic_demographic FOREIGN KEY (demographic_id) REFERENCES demographic (id) ON DELETE CASCADE
);