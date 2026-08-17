Yes. **DML can absolutely be used with joins**, but it depends on the operation and the database.

Here's how it works in PostgreSQL.

---

# 1. SELECT with JOIN ✅ (Most Common)

```sql
SELECT
    o.id,
    o.name,
    e.employee_name
FROM Organization o
JOIN Employee e
ON o.id = e.organization_id;
```

---

# 2. UPDATE with JOIN ✅

In PostgreSQL, you use the `FROM` clause.

```sql
UPDATE Organization o
SET status = 'ACTIVE'
FROM Employee e
WHERE o.id = e.organization_id
  AND e.department = 'IT';
```

---

# 3. DELETE with JOIN ✅

Again, PostgreSQL uses the `USING` clause.

```sql
DELETE FROM Organization o
USING Employee e
WHERE o.id = e.organization_id
  AND e.department = 'IT';
```

---

# 4. INSERT with JOIN ✅

Usually done with `INSERT ... SELECT`.

```sql
INSERT INTO ActiveOrganizations (id, name)
SELECT
    o.id,
    o.name
FROM Organization o
JOIN Employee e
ON o.id = e.organization_id
WHERE e.department = 'IT';
```

---

# Summary

| DML Command | JOIN Supported? | PostgreSQL Syntax                 |
| ----------- | --------------- | --------------------------------- |
| `SELECT`    | ✅ Yes          | `JOIN`                            |
| `INSERT`    | ✅ Yes          | `INSERT INTO ... SELECT ... JOIN` |
| `UPDATE`    | ✅ Yes          | `UPDATE ... FROM`                 |
| `DELETE`    | ✅ Yes          | `DELETE ... USING`                |

---

## Important Note

People often say **"UPDATE with JOIN"** or **"DELETE with JOIN"**, but in PostgreSQL the syntax is slightly different:

- **UPDATE** → uses `FROM`
- **DELETE** → uses `USING`
- **INSERT** → uses `SELECT ... JOIN`

The effect is the same as performing the operation based on matching rows from another table.

Since you're building SQL notes, I'd also add a separate section later called **"DML with JOINs"** after learning basic DML. It's a common interview topic and frequently used in real-world PostgreSQL development.
