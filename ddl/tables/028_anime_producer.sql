CREATE TABLE anime_producer (
    anime_id integer NOT NULL,
    producer_id integer NOT NULL,
    PRIMARY KEY (anime_id, producer_id),
    CONSTRAINT fk_anime_producer_anime FOREIGN KEY (anime_id) REFERENCES anime (id) ON DELETE CASCADE,
    CONSTRAINT fk_anime_producer_producer FOREIGN KEY (producer_id) REFERENCES producer (id) ON DELETE CASCADE
);