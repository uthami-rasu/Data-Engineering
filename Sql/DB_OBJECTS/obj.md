In PostgreSQL, a **table** is just one type of database object. PostgreSQL supports many other objects, each serving a different purpose.

## Main PostgreSQL Database Objects

| Object                | Description                                                               | Example                                            |
| --------------------- | ------------------------------------------------------------------------- | -------------------------------------------------- |
| **Database**          | Top-level container that holds schemas and objects.                       | `CREATE DATABASE company_db;`                      |
| **Schema**            | Logical namespace that organizes objects.                                 | `CREATE SCHEMA hr;`                                |
| **Table**             | Stores data in rows and columns.                                          | `CREATE TABLE employees (...);`                    |
| **View**              | Virtual table created from a query.                                       | `CREATE VIEW emp_view AS SELECT * FROM employees;` |
| **Materialized View** | Stores the query result physically for faster access.                     | `CREATE MATERIALIZED VIEW sales_summary AS ...;`   |
| **Sequence**          | Generates sequential numbers.                                             | `CREATE SEQUENCE emp_seq;`                         |
| **Index**             | Improves query performance.                                               | `CREATE INDEX idx_name ON employees(name);`        |
| **Function**          | Returns a value after executing logic.                                    | `CREATE FUNCTION get_salary(...)`                  |
| **Procedure**         | Executes business logic without returning a value (can use transactions). | `CREATE PROCEDURE update_salary(...)`              |
| **Trigger**           | Automatically executes when INSERT, UPDATE, DELETE occurs.                | `CREATE TRIGGER trg_before_insert ...`             |
| **Trigger Function**  | Function executed by a trigger.                                           | `CREATE FUNCTION audit_trigger()`                  |
| **Constraint**        | Enforces data integrity.                                                  | PRIMARY KEY, FOREIGN KEY, CHECK                    |
| **Domain**            | Custom reusable data type with rules.                                     | `CREATE DOMAIN email_type AS TEXT CHECK (...);`    |
| **Type**              | User-defined data type.                                                   | `CREATE TYPE status AS ENUM (...);`                |
| **Extension**         | Adds additional PostgreSQL features.                                      | `CREATE EXTENSION pgcrypto;`                       |
| **Role/User**         | Authentication and permissions.                                           | `CREATE ROLE admin;`                               |
| **Tablespace**        | Defines where data is stored on disk.                                     | `CREATE TABLESPACE fast_disk ...;`                 |
| **Foreign Table**     | Represents data stored in an external database.                           | `CREATE FOREIGN TABLE ...;`                        |
| **Publication**       | Used for logical replication (publisher).                                 | `CREATE PUBLICATION pub1;`                         |
| **Subscription**      | Receives replicated data from a publication.                              | `CREATE SUBSCRIPTION sub1 ...;`                    |

---

# Most Common Objects (Used Daily)

If you're learning PostgreSQL for interviews or Data Engineering, you'll encounter these the most:

```
Database
│
├── Schema
│   ├── Tables
│   ├── Views
│   ├── Materialized Views
│   ├── Sequences
│   ├── Indexes
│   ├── Functions
│   ├── Procedures
│   ├── Triggers
│   ├── Types
│   ├── Domains
│   └── Constraints
│
├── Roles / Users
├── Extensions
└── Tablespaces
```

---

# Data Storage Objects

These objects store or organize data.

- Database
- Schema
- Table
- Foreign Table
- View
- Materialized View

---

# Performance Objects

These improve query speed.

- Index
- Materialized View
- Tablespace

---

# Programming Objects

Used to write business logic.

- Function
- Procedure
- Trigger
- Trigger Function

---

# Data Integrity Objects

Ensure data quality.

- Constraints
  - PRIMARY KEY
  - FOREIGN KEY
  - UNIQUE
  - CHECK
  - NOT NULL

- Domain
- User-defined Type

---

# Security Objects

Control access.

- Role
- User (a login-enabled role)

---

# Replication Objects

Used in high availability and data replication.

- Publication
- Subscription

---

# Useful Commands to List Objects

### List Tables

```sql
\dt
```

### List Views

```sql
\dv
```

### List Sequences

```sql
\ds
```

### List Indexes

```sql
\di
```

### List Functions

```sql
\df
```

### List Procedures

```sql
\dfP
```

### List Schemas

```sql
\dn
```

### List Roles

```sql
\du
```

### List All Relations (tables, views, sequences, etc.)

```sql
\d
```

---

## Recommended Learning Order

Since you've already covered **tables** and are learning SQL/PostgreSQL systematically, I recommend this order:

1. Database
2. Schema
3. Table
4. Constraints
5. Views
6. Materialized Views
7. Sequences
8. Indexes
9. Functions
10. Procedures
11. Triggers
12. Roles & Privileges (DCL)
13. Transactions (TCL)
14. Extensions
15. Tablespaces
16. Replication (Publication & Subscription)

This progression builds from core database concepts to more advanced PostgreSQL features used in production systems.
