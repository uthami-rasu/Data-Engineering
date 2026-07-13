Absolutely. Below is a **complete, structured guide to SQL Constraints** (especially PostgreSQL). It covers everything from basics to advanced concepts in a way that's useful for interviews and real-world development.

---

# SQL Constraints

## What is a Constraint?

A **constraint** is a rule applied to one or more columns of a table to ensure the **accuracy, validity, and integrity** of the data.

Without constraints, users could insert invalid or inconsistent data into the database.

---

## Why do we use Constraints?

Constraints help to:

- Ensure data integrity
- Prevent invalid data
- Enforce business rules
- Maintain relationships between tables
- Improve data consistency

---

# Types of Constraints

| Constraint               | Purpose                                    |
| ------------------------ | ------------------------------------------ |
| PRIMARY KEY              | Uniquely identifies each row               |
| FOREIGN KEY              | Maintains relationships between tables     |
| UNIQUE                   | Prevents duplicate values                  |
| NOT NULL                 | Prevents NULL values                       |
| CHECK                    | Validates data based on a condition        |
| DEFAULT                  | Assigns a default value                    |
| EXCLUSION _(PostgreSQL)_ | Prevents overlapping or conflicting values |

---

# Constraint Creation Methods

There are two ways to create constraints.

## 1. Column-Level Constraint

Constraint is written immediately after the column.

```sql
id SERIAL PRIMARY KEY

name VARCHAR(100) NOT NULL

email VARCHAR(100) UNIQUE

salary NUMERIC CHECK (salary > 0)
```

---

## 2. Table-Level Constraint

Constraint is written after all columns.

```sql
CREATE TABLE Employee (

    id INT,

    email VARCHAR(100),

    salary NUMERIC,

    CONSTRAINT pk_employee
        PRIMARY KEY (id),

    CONSTRAINT uq_employee_email
        UNIQUE (email),

    CONSTRAINT chk_salary
        CHECK (salary > 0)

);
```

---

# Column-Level vs Table-Level

| Feature                             | Column Level | Table Level |
| ----------------------------------- | ------------ | ----------- |
| Single-column constraint            | ✅           | ✅          |
| Multiple-column constraint          | ❌           | ✅          |
| Named constraints                   | Usually No   | Yes         |
| Preferred for composite constraints | ❌           | ✅          |

---

# Composite Constraints

A composite constraint uses **multiple columns**.

Example

```sql
PRIMARY KEY(student_id, course_id)
```

The **combination** must be unique.

Composite constraints are possible with

- PRIMARY KEY
- UNIQUE
- FOREIGN KEY
- CHECK

NOT NULL and DEFAULT cannot be composite.

---

# PRIMARY KEY

## Purpose

Uniquely identifies every row.

### Example

```sql
id SERIAL PRIMARY KEY
```

### Rules

- Must be unique
- Cannot contain NULL
- Only one PRIMARY KEY constraint per table

---

## Composite Primary Key

```sql
PRIMARY KEY(student_id, course_id)
```

A table still has only **one PRIMARY KEY**, but it consists of multiple columns.

---

# UNIQUE

Prevents duplicate values.

```sql
email VARCHAR(100) UNIQUE
```

Multiple UNIQUE constraints are allowed.

```sql
email UNIQUE

phone UNIQUE

passport UNIQUE
```

---

## Composite UNIQUE

```sql
UNIQUE(first_name, last_name)
```

Only the combination must be unique.

---

# PRIMARY KEY vs UNIQUE

| PRIMARY KEY         | UNIQUE                                 |
| ------------------- | -------------------------------------- |
| Only one per table  | Multiple allowed                       |
| Cannot contain NULL | PostgreSQL allows multiple NULL values |
| Main identifier     | Additional unique columns              |

---

# FOREIGN KEY

Maintains relationships between tables.

Parent Table

```sql
CREATE TABLE Department (

    id INT PRIMARY KEY

);
```

Child Table

```sql
CREATE TABLE Employee (

    id INT PRIMARY KEY,

    department_id INT,

    FOREIGN KEY(department_id)
    REFERENCES Department(id)

);
```

---

## Composite Foreign Key

```sql
FOREIGN KEY(order_id, product_id)

REFERENCES Orders(order_id, product_id)
```

---

# NOT NULL

Ensures a value is always provided.

```sql
name VARCHAR(100) NOT NULL
```

---

# CHECK

Validates values.

```sql
CHECK(age >= 18)
```

Another example

```sql
CHECK(price > 0)
```

---

## Composite CHECK

```sql
CHECK(discount <= price)
```

The condition uses two columns.

---

# DEFAULT

Provides a default value.

```sql
status VARCHAR(20)

DEFAULT 'ACTIVE'
```

---

# EXCLUSION Constraint (PostgreSQL)

Used to prevent overlapping values.

Example

Meeting Room Booking

```text
Room A

10:00 - 11:00

10:30 - 11:30
```

This overlap can be prevented using an EXCLUDE constraint.

This is an advanced PostgreSQL feature.

---

# Named Constraints

Instead of

```sql
PRIMARY KEY(id)
```

Use

```sql
CONSTRAINT pk_employee

PRIMARY KEY(id)
```

Benefits

- Easy to identify
- Easy to modify
- Easy to drop

---

# Common Naming Convention

| Constraint                         | Prefix |
| ---------------------------------- | ------ |
| PRIMARY KEY                        | pk\_   |
| FOREIGN KEY                        | fk\_   |
| UNIQUE                             | uq\_   |
| CHECK                              | chk\_  |
| DEFAULT _(commonly in SQL Server)_ | df\_   |

Example

```text
pk_employee

fk_employee_department

uq_employee_email

chk_salary
```

---

# Adding Constraints

```sql
ALTER TABLE Employee

ADD CONSTRAINT uq_email

UNIQUE(email);
```

---

# Dropping Constraints

```sql
ALTER TABLE Employee

DROP CONSTRAINT uq_email;
```

---

# Renaming Constraints

```sql
ALTER TABLE Employee

RENAME CONSTRAINT uq_email

TO uq_employee_email;
```

---

# Enabling / Disabling Constraints

Different databases support this differently.

SQL Server

```sql
ALTER TABLE Employee

NOCHECK CONSTRAINT ALL;
```

PostgreSQL does **not** support disabling constraints in this way. Instead, you typically drop and recreate constraints or use deferred constraint checking where applicable.

---

# Deferred Constraints (PostgreSQL)

Some constraints (such as foreign keys) can be checked **at transaction commit time** instead of immediately.

```sql
DEFERRABLE INITIALLY DEFERRED
```

Useful during complex transactions involving related tables.

---

# Information Schema

View all constraints

```sql
SELECT *

FROM information_schema.table_constraints;
```

View key column usage

```sql
SELECT *

FROM information_schema.key_column_usage;
```

---

# Best Practices

✅ Always name table-level constraints.

✅ Use PRIMARY KEY for the main identifier.

✅ Use UNIQUE for alternate unique values.

✅ Use CHECK to enforce business rules.

✅ Use FOREIGN KEY to maintain relationships.

✅ Use NOT NULL for mandatory columns.

✅ Use DEFAULT for commonly assigned values.

---

# Interview Questions

### Can a table have two PRIMARY KEYs?

No.

A table can have only **one PRIMARY KEY constraint**, but that constraint can include multiple columns.

---

### Can a table have multiple UNIQUE constraints?

Yes.

---

### Which constraints can be composite?

- PRIMARY KEY
- UNIQUE
- FOREIGN KEY
- CHECK

---

### Which constraints cannot be composite?

- NOT NULL
- DEFAULT

---

### What's the difference between column-level and table-level constraints?

Single-column constraints:

- Column-level ✅
- Table-level ✅

Multiple-column constraints:

- Table-level only ✅

---

### Which constraints are most commonly used?

1. PRIMARY KEY
2. FOREIGN KEY
3. UNIQUE
4. NOT NULL
5. CHECK
6. DEFAULT

---

# Recommended Learning Order

1. NOT NULL
2. DEFAULT
3. PRIMARY KEY
4. UNIQUE
5. PRIMARY KEY vs UNIQUE
6. FOREIGN KEY
7. CHECK
8. Column-Level Constraints
9. Table-Level Constraints
10. Composite Constraints
11. Named Constraints
12. Constraint Naming Conventions
13. ALTER TABLE (Add/Drop/Rename Constraints)
14. Deferred Constraints (PostgreSQL)
15. EXCLUSION Constraints (PostgreSQL)

This roadmap takes you from the fundamentals to PostgreSQL-specific features and covers essentially everything you'll encounter in interviews and everyday SQL development.
