```mermaid
---
title: sql ER Diagram
config:
    layout: elk
---
erDiagram
    ANIME {
        int id PK
        int type_id FK "nullable"
        int rating_id FK "nullable"
        int season_id FK "nullable"
        int source_id FK
        int status_id FK
        string title
        string title_japanese
        string url
        string image_url
        decimal score "nullable"
        decimal scored_by "nullable"
        date start_date "nullable"
        date end_date "nullable"
        string synopsis "nullable"
        decimal rank "nullable"
        int popularity
        int members
        int favorites
        decimal episodes "nullable"
        decimal year "nullable"
    }


    GENRES {
        int id PK
        string genre
    }
    ANIME_GENRES {
        int anime_id PK,FK
        int genre_id PK,FK
    }
    ANIME }|--|{ ANIME_GENRES : 1_to_n
    GENRES }|--|{ ANIME_GENRES : 0_to_n


    EXPLICIT_GENRES {
        int id PK
        string explicit_genre
    }
    ANIME_EXPLICIT_GENRES {
        int anime_id PK,FK
        int explicit_genre_id PK,FK
    }
    ANIME }|--|{ ANIME_EXPLICIT_GENRES : 0_to_n
    EXPLICIT_GENRES }|--|{ ANIME_EXPLICIT_GENRES : 0_to_n


    TYPES {
        int id PK
        string type
    }
    ANIME }|--|{ TYPES : 1_to_1
    

    LICENSORS {
        int id PK
        string licensor
    }
    ANIME_LICENSORS {
        int anime_id PK,FK
        int licensor_id PK,FK
    }
    LICENSORS }|--|{ ANIME_LICENSORS : 0_to_n
    ANIME }|--|{ ANIME_LICENSORS : 0_to_n


    DEMOGRAPHICS {
        int id PK
        string demographic
    }
    ANIME_DEMOGRAPHICS {
        int anime_id PK,FK
        int demographic_id PK,FK
    }
    DEMOGRAPHICS }|--|{ ANIME_DEMOGRAPHICS : 0_to_n
    ANIME }|--|{ ANIME_DEMOGRAPHICS : 0_to_n


    PRODUCERS {
        int id PK
        string producer
    }
    ANIME_PRODUCERS {
        int anime_id PK,FK
        int producer_id PK,FK
    }
    PRODUCERS }|--|{ ANIME_PRODUCERS : 0_to_n
    ANIME }|--|{ ANIME_PRODUCERS : 0_to_n


    RATINGS {
        int id PK
        string rating
    }
    ANIME }|--|{ RATINGS : 1_to_1


    SEASONS {
        int id PK
        string season
    }
    ANIME }|--|{ SEASONS : 1_to_1


    SOURCES {
        int id PK
        string source
    }
    ANIME }|--|{ SOURCES : 1_to_1


    STREAMING_SERVICES {
        int id PK
        string streaming_service
    }
    ANIME_STREAMING_SERVICES {
        int anime_id PK,FK
        int streaming_service_id PK,FK
    }
    STREAMING_SERVICES }|--|{ ANIME_STREAMING_SERVICES : 0_to_n
    ANIME }|--|{ ANIME_STREAMING_SERVICES : 0_to_n


    STATUSES {
        int id PK
        string status
    }
    ANIME }|--|{ STATUSES : 1_to_1


    STUDIOS {
        int id PK
        string studio
    }
    ANIME_STUDIOS {
        int anime_id PK,FK
        int studio_id PK,FK
    }
    STUDIOS }|--|{ ANIME_STUDIOS : 0_to_n
    ANIME }|--|{ ANIME_STUDIOS : 0_to_n


    THEMES {
        int id PK
        string theme
    }
    ANIME_THEMES {
        int anime_id PK,FK
        int theme_id PK,FK
    }
    THEMES }|--|{ ANIME_THEMES : 0_to_n
    ANIME }|--|{ ANIME_THEMES : 0_to_n



    CHARACTERS {
        int id PK
    }
    CHARACTER_ANIME_WORKS {
        int anime_id PK,FK
        int character_id PK,FK
        int role_id FK
    }
    CHARACTER_ANIME_ROLES{
        int id PK
        string role
    }
    ANIME }|--|{ CHARACTER_ANIME_WORKS : has
    CHARACTERS }|--|{ CHARACTER_ANIME_WORKS : has
    CHARACTER_ANIME_ROLES }|--|{ CHARACTER_ANIME_WORKS : has

    CHARACTER_NICKNAMES {
        int character_id PK,FK
        string nickname PK
    }
    CHARACTERS }|--|{ CHARACTER_NICKNAMES : has

    PEOPLE {
        int id PK
    }
    PEOPLE_ANIME_WORKS {
        int anime_id PK,FK
        int people_id PK,FK
        int role_id FK
    }
    PEOPLE_ALTERNATE_NAMES {
        int people_id PK,FK
        string alternate_name PK
    }
    PEOPLE }|--|{ PEOPLE_ANIME_WORKS : has
    PEOPLE }|--|{ PEOPLE_ALTERNATE_NAMES : has
    CHARACTER_ANIME_ROLES }|--|{ PEOPLE_ANIME_WORKS : has
```