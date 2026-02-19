CREATE TABLE anime_streaming_service (
    anime_id integer NOT NULL,
    streaming_service_id integer NOT NULL,
    PRIMARY KEY (anime_id, streaming_service_id),
    CONSTRAINT fk_anime_streaming_service_anime FOREIGN KEY (anime_id) REFERENCES anime (id) ON DELETE CASCADE,
    CONSTRAINT fk_anime_streaming_service_service FOREIGN KEY (streaming_service_id) REFERENCES streaming_service (id) ON DELETE CASCADE
);