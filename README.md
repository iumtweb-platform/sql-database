# database
Repository to handle ER schema and DDL scripts

## Table creation PostgreSQL

- The SQL scripts for the tables are under [ddl/tables](ddl/tables), ordered by a numbered prefix (`001_...sql`, `002_...sql`, ...).
- Runner: [ddl/create-all.py](ddl/create-all.py).

The script automatically load the environment variables through the .env.local file. First ensure the DB instance is running correctly, then duplicate the .env.example and change the variable DATABASE_URL to the appropriate value.

Dipendenza Python richiesta:

- `pip install psycopg[binary]`
