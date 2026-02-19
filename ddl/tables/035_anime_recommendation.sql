CREATE TABLE anime_recommendation (
    anime_id integer NOT NULL,
    recommended_anime_id integer NOT NULL,
    PRIMARY KEY (anime_id, recommended_anime_id),
    CONSTRAINT fk_anime_recommendation_anime FOREIGN KEY (anime_id) REFERENCES anime (id) ON DELETE CASCADE,
    CONSTRAINT fk_anime_recommendation_recommended_anime FOREIGN KEY (recommended_anime_id) REFERENCES anime (id) ON DELETE CASCADE
);