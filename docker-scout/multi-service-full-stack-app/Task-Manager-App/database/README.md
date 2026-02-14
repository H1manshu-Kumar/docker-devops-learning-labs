# Database Configuration

## Environment Variables
- `POSTGRES_DB`: taskdb
- `POSTGRES_USER`: taskuser  
- `POSTGRES_PASSWORD`: taskpass

## Volume Usage
- `db_data:/var/lib/postgresql/data` - Persists database data

## Network
- Connects to `task-network` bridge network
- Accessible by frontend service via hostname `task-db`

## Database Schema
```sql
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```