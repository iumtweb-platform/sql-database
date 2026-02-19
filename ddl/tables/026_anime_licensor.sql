CREATE TABLE anime_licensor (
    anime_id integer NOT NULL,
    licensor_id integer NOT NULL,
    PRIMARY KEY (anime_id, licensor_id),
    CONSTRAINT fk_anime_licensor_anime FOREIGN KEY (anime_id) REFERENCES anime (id) ON DELETE CASCADE,
    CONSTRAINT fk_anime_licensor_licensor FOREIGN KEY (licensor_id) REFERENCES licensor (id) ON DELETE CASCADE
);