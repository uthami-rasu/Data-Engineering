Absolutely. Here are concise but interview-focused notes on **SQL Subqueries**.

# SQL Subqueries

## What is a Subquery?

A **subquery** is a query written inside another SQL query.

It is enclosed in parentheses `()`.

```sql
SELECT *
FROM employee
WHERE salary > (
    SELECT AVG(salary)
    FROM employee
);
```

Execution:

1. Calculate average salary.
2. Compare each employee's salary with the average.
3. Return matching employees.

---

# Types of Subqueries

## 1. Scalar Subquery

Returns **exactly one value**.

```sql
SELECT *
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);
```

Output of subquery:

```
65000
```

Main query becomes

```sql
WHERE salary > 65000
```

---

## 2. Single Row Subquery

Returns one row.

Can use

- =
- <
- >
- <=
- > =
- <>

Example

```sql
SELECT *
FROM employee
WHERE dept_id =
(
    SELECT id
    FROM department
    WHERE name='HR'
);
```

---

## 3. Multiple Row Subquery

Returns multiple rows.

Must use

- IN
- ANY
- ALL
- EXISTS

Example

```sql
SELECT *
FROM employee
WHERE dept_id IN
(
    SELECT id
    FROM department
);
```

---

## 4. Multiple Column Subquery

Returns multiple columns.

```sql
SELECT *
FROM employee
WHERE (dept_id, salary) IN
(
    SELECT dept_id, MAX(salary)
    FROM employee
    GROUP BY dept_id
);
```

---

# WHERE Clause Subquery

Most common.

```sql
SELECT *
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);
```

---

# FROM Clause Subquery (Derived Table)

The subquery acts like a temporary table.

```sql
SELECT *
FROM
(
    SELECT dept_id,
           AVG(salary) avg_salary
    FROM employee
    GROUP BY dept_id
) t;
```

Think of it as

```
Temporary Table
↓

Outer Query
```

---

# SELECT Clause Subquery

Returns a single value for every row.

```sql
SELECT
    name,
    (
        SELECT name
        FROM department d
        WHERE d.id=e.dept_id
    ) AS department
FROM employee e;
```

---

# Correlated Subquery

Most important interview topic.

The inner query depends on the outer query.

```sql
SELECT *
FROM employee e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
    WHERE dept_id=e.dept_id
);
```

Here

```sql
e.dept_id
```

comes from the outer query.

Execution

```
Employee 1
    ↓
Run Inner Query

Employee 2
    ↓
Run Inner Query

Employee 3
    ↓
Run Inner Query
```

The inner query executes for each outer row (conceptually). The optimizer may rewrite it internally.

---

# Non-Correlated Subquery

Independent query.

```sql
SELECT *
FROM employee
WHERE dept_id=
(
    SELECT id
    FROM department
    WHERE name='IT'
);
```

Runs independently.

---

# EXISTS

Checks whether at least one row exists.

Returns TRUE or FALSE.

```sql
SELECT *
FROM employee e
WHERE EXISTS
(
    SELECT 1
    FROM department d
    WHERE d.id=e.dept_id
);
```

Important:

`SELECT 1`

or

`SELECT *`

or

`SELECT 'Hello'`

All behave the same because `EXISTS` ignores the selected value. It only checks whether any row is returned.

---

# NOT EXISTS

Returns rows for which the subquery returns no rows.

```sql
SELECT *
FROM department d
WHERE NOT EXISTS
(
    SELECT 1
    FROM employee e
    WHERE e.dept_id=d.id
);
```

Departments with no employees.

---

# IN

Checks membership.

```sql
SELECT *
FROM employee
WHERE dept_id IN
(
    SELECT id
    FROM department
);
```

Equivalent to

```sql
dept_id=1
OR dept_id=2
OR dept_id=3
```

---

# NOT IN

```sql
SELECT *
FROM employee
WHERE dept_id NOT IN
(
    SELECT id
    FROM department
);
```

⚠️ Be careful with `NULL` values. If the subquery returns a `NULL`, `NOT IN` can return no rows due to SQL's three-valued logic.

Safer alternative:

```sql
SELECT *
FROM employee e
WHERE NOT EXISTS
(
    SELECT 1
    FROM department d
    WHERE d.id=e.dept_id
);
```

---

# ANY

Compare with any value.

```sql
SELECT *
FROM employee
WHERE salary > ANY
(
    SELECT salary
    FROM employee
    WHERE dept_id=10
);
```

Meaning:

```
salary > at least one salary
```

Equivalent to:

```
salary > MIN(salaries)
```

---

# ALL

Compare with every value.

```sql
SELECT *
FROM employee
WHERE salary > ALL
(
    SELECT salary
    FROM employee
    WHERE dept_id=10
);
```

Meaning:

```
salary > every salary
```

Equivalent to:

```
salary > MAX(salaries)
```

---

# Subquery vs JOIN

Use a **subquery** when:

- You need a calculated value (e.g., average salary).
- You need `EXISTS` or `NOT EXISTS`.
- The logic is naturally expressed in nested steps.

Use a **JOIN** when:

- You need columns from multiple tables.
- You need better readability for combining related data.
- You're retrieving related records rather than filtering by a calculated result.

---

# Common Interview Questions

### Employees earning more than the company average

```sql
SELECT *
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);
```

---

### Highest salary in each department

```sql
SELECT *
FROM employee e
WHERE salary=
(
    SELECT MAX(salary)
    FROM employee
    WHERE dept_id=e.dept_id
);
```

(Correlated subquery.)

---

### Departments with no employees

```sql
SELECT *
FROM department d
WHERE NOT EXISTS
(
    SELECT 1
    FROM employee e
    WHERE e.dept_id=d.id
);
```

---

### Employees working in the HR department

```sql
SELECT *
FROM employee
WHERE dept_id=
(
    SELECT id
    FROM department
    WHERE name='HR'
);
```

---

# Performance Notes

- **Non-correlated subqueries** are often evaluated once.
- **Correlated subqueries** are logically evaluated per outer row, but modern optimizers (PostgreSQL, MySQL, SQL Server, Oracle) frequently transform them into efficient joins or semi-joins.
- `EXISTS` is usually preferred over `IN` when checking for existence, especially if the subquery may return many rows.
- Prefer `NOT EXISTS` over `NOT IN` when the subquery can produce `NULL` values.

---

# Quick Revision Table

| Type            | Returns                | Operators                    |
| --------------- | ---------------------- | ---------------------------- |
| Scalar          | One value              | `=`, `>`, `<`, `>=`, `<=`    |
| Single Row      | One row                | `=`, `>`, `<`, `<>`          |
| Multiple Row    | Many rows              | `IN`, `ANY`, `ALL`, `EXISTS` |
| Correlated      | Depends on outer query | Any valid operator           |
| Non-Correlated  | Independent            | Any valid operator           |
| FROM Subquery   | Temporary table        | Alias required               |
| SELECT Subquery | Single value per row   | Scalar only                  |

These concepts cover the vast majority of subquery questions asked in SQL interviews, especially for PostgreSQL, MySQL, SQL Server, and Oracle.
