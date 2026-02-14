SELECT 'CREATE DATABASE taskdb' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'taskdb')\gexec
\c taskdb;

DO
$$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'taskuser') THEN
      CREATE USER taskuser WITH PASSWORD 'taskpass';
   END IF;
END
$$;

CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

GRANT ALL PRIVILEGES ON DATABASE taskdb TO taskuser;
GRANT ALL PRIVILEGES ON TABLE tasks TO taskuser;
GRANT USAGE, SELECT ON SEQUENCE tasks_id_seq TO taskuser;
