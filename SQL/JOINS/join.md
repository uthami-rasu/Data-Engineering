1. **Cheat Sheet (Quick Revision)**
2. **Deep Dive into each JOIN**
3. **Important JOIN concepts (`ON`, `USING`, `WHERE`, aliases, NULL handling, etc.)**
4. **Interview Questions & Answers**
5. **Performance & Execution Plans**

---

# PostgreSQL JOIN Cheat Sheet

We'll use these tables throughout.

## Employee

| id  | name    | dept_id | manager_id |
| --- | ------- | ------- | ---------- |
| 1   | Alice   | 1       | NULL       |
| 2   | Bob     | 2       | 1          |
| 3   | Charlie | 2       | 2          |
| 4   | David   | 3       | 1          |
| 5   | Eve     | NULL    | 2          |

---

## Department

| id  | department |
| --- | ---------- |
| 1   | HR         |
| 2   | IT         |
| 3   | Sales      |
| 4   | Finance    |

Notice:

- Employee 5 has **no department**
- Finance has **no employee**

---

# 1. INNER JOIN

Returns only matching rows.

```sql
SELECT
    e.name,
    d.department
FROM employee e
INNER JOIN department d
ON e.dept_id = d.id;
```

Result

| name    | department |
| ------- | ---------- |
| Alice   | HR         |
| Bob     | IT         |
| Charlie | IT         |
| David   | Sales      |

Employee Eve disappears because no matching department.

---

# 2. LEFT JOIN

Returns every row from the left table.

```sql
SELECT
    e.name,
    d.department
FROM employee e
LEFT JOIN department d
ON e.dept_id = d.id;
```

Result

| name    | department |
| ------- | ---------- |
| Alice   | HR         |
| Bob     | IT         |
| Charlie | IT         |
| David   | Sales      |
| Eve     | NULL       |

---

# 3. RIGHT JOIN

Returns every row from the right table.

```sql
SELECT
    e.name,
    d.department
FROM employee e
RIGHT JOIN department d
ON e.dept_id=d.id;
```

Result

| name    | department |
| ------- | ---------- |
| Alice   | HR         |
| Bob     | IT         |
| Charlie | IT         |
| David   | Sales      |
| NULL    | Finance    |

---

# 4. FULL JOIN

Returns everything.

```sql
SELECT
    e.name,
    d.department
FROM employee e
FULL JOIN department d
ON e.dept_id=d.id;
```

Result

| name    | department |
| ------- | ---------- |
| Alice   | HR         |
| Bob     | IT         |
| Charlie | IT         |
| David   | Sales      |
| Eve     | NULL       |
| NULL    | Finance    |

---

# 5. CROSS JOIN

Every employee × every department.

```sql
SELECT
    e.name,
    d.department
FROM employee e
CROSS JOIN department d;
```

5 employees

×

4 departments

=

20 rows

---

# 6. SELF JOIN

Employee → Manager

```sql
SELECT
    e.name,
    m.name AS manager
FROM employee e
LEFT JOIN employee m
ON e.manager_id=m.id;
```

Result

| Employee | Manager |
| -------- | ------- |
| Alice    | NULL    |
| Bob      | Alice   |
| Charlie  | Bob     |
| David    | Alice   |
| Eve      | Bob     |

---

# USING

Instead of

```sql
SELECT *
FROM employee e
JOIN department d
ON e.dept_id=d.id;
```

If both columns have the same name

```
department_id
```

then

```sql
SELECT *
FROM employee
JOIN department
USING (department_id);
```

No need to write

```sql
ON employee.department_id=department.department_id
```

---

# NATURAL JOIN

```sql
SELECT *
FROM employee
NATURAL JOIN department;
```

Automatically joins all columns with the same name.

Avoid in production.

---

# EXISTS (Semi Join)

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

Returns only employees having departments.

---

# NOT EXISTS (Anti Join)

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

Result

```
Eve
```

---

# LATERAL JOIN

```sql
SELECT *
FROM department d
CROSS JOIN LATERAL
(
    SELECT *
    FROM employee e
    WHERE e.dept_id=d.id
    LIMIT 1
) x;
```

Very common in PostgreSQL.

---

# JOIN Syntax Cheat Sheet

```sql
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL JOIN
CROSS JOIN
SELF JOIN
JOIN ... USING
NATURAL JOIN
LATERAL JOIN
```

---

# Most Important Concepts

---

# 1. ON

Determines **how two tables match**.

```sql
SELECT *
FROM employee e
JOIN department d
ON e.dept_id=d.id;
```

Think of ON as:

> "Which rows should be paired?"

Without ON

```
Employee

1
2
3

Department

A
B
C
```

Database cannot know

Should

```
1→A
2→B
3→C
```

or

```
1→B
```

etc.

ON tells PostgreSQL exactly how to connect them.

---

# 2. USING

Only works when both tables have the **same column name**.

Example

Employee

```
department_id
```

Department

```
department_id
```

Instead of

```sql
ON employee.department_id=department.department_id
```

write

```sql
USING (department_id)
```

---

Another advantage

Without USING

```sql
SELECT *
```

returns

```
department_id
department_id
```

(two columns)

With USING

```sql
department_id
```

(only one column)

This makes the output cleaner.

---

# 3. ON vs WHERE ⭐⭐⭐⭐⭐

This is one of the most important interview topics.

Example

```sql
SELECT *
FROM employee e
LEFT JOIN department d
ON e.dept_id=d.id;
```

returns

```
Alice HR
Bob IT
Eve NULL
```

Now

```sql
SELECT *
FROM employee e
LEFT JOIN department d
ON e.dept_id=d.id
WHERE d.department='IT';
```

Result

```
Bob IT
```

The `WHERE` clause removes the `NULL` rows produced by the `LEFT JOIN`, making it behave like an `INNER JOIN`.

---

Instead

```sql
SELECT *
FROM employee e
LEFT JOIN department d
ON e.dept_id=d.id
AND d.department='IT';
```

Result

```
Alice NULL
Bob IT
Charlie IT
David NULL
Eve NULL
```

Notice

LEFT JOIN remains LEFT JOIN.

---

### Rule

```
ON
↓

matches rows

WHERE
↓

filters rows after joining
```

This single concept is asked in almost every SQL interview.

---

# 4. Table Aliases

Instead of

```sql
employee.department_id
```

use

```sql
e.department_id
```

Example

```sql
FROM employee e
JOIN department d
```

Aliases improve readability and are essential in self joins.

---

# 5. Why SELF JOIN Needs Aliases

Wrong

```sql
employee
JOIN employee
```

Which `employee.id`?

Impossible to distinguish.

Correct

```sql
employee e
JOIN employee m
```

Now

```
e.name

m.name
```

is unambiguous.

---

# 6. JOIN Execution Order (Logical)

A useful mental model is:

```
FROM
↓

JOIN
↓

ON
↓

WHERE
↓

GROUP BY
↓

HAVING
↓

SELECT
↓

ORDER BY
↓

LIMIT
```

Knowing this explains why filtering in `ON` and `WHERE` can produce different results with outer joins.

---

This cheat sheet covers about **80% of the JOIN questions** you'll encounter in PostgreSQL interviews. After this, the next topics worth documenting are:

1. **INNER JOIN** (deep dive with diagrams and execution flow)
2. **LEFT JOIN** (deep dive)
3. **RIGHT JOIN**
4. **FULL JOIN**
5. **SELF JOIN**
6. **CROSS JOIN**
7. **USING**
8. **NATURAL JOIN**
9. **LATERAL JOIN**
10. **Semi Join (`EXISTS`)**
11. **Anti Join (`NOT EXISTS`)**
12. **Join performance and execution plans (`Nested Loop`, `Hash Join`, `Merge Join`)**

This progression takes you from practical SQL writing to understanding how PostgreSQL actually executes joins.
