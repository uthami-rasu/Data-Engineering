```sql
-- ============================================================
-- DELETE
-- ============================================================

-- Syntax

DELETE FROM table_name
WHERE condition;
```

---

## 1. Delete a Single Row

```sql
DELETE FROM Organization
WHERE id = 1;
```

---

## 2. Delete Multiple Rows

```sql
DELETE FROM Organization
WHERE status = 'INACTIVE';
```

---

## 3. Delete All Rows

> **No WHERE clause**

```sql
DELETE FROM Organization;
```

> **Note:** The table structure remains unchanged.

---

## 4. Delete Using Multiple Conditions

```sql
DELETE FROM Organization
WHERE status = 'INACTIVE'
AND amount < 10000;
```

---

## 5. Delete Using IN

```sql
DELETE FROM Organization
WHERE id IN (1, 2, 3);
```

---

## 6. Delete Using BETWEEN

```sql
DELETE FROM Organization
WHERE amount BETWEEN 10000 AND 50000;
```

---

## 7. Delete Using LIKE

```sql
DELETE FROM Organization
WHERE name LIKE 'A%';
```

---

## 8. Delete Using EXISTS

```sql
DELETE FROM Organization o
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.organization_id = o.id
);
```

---

## 9. Delete Using a Subquery

```sql
DELETE FROM Organization
WHERE id IN (
    SELECT organization_id
    FROM inactive_organizations
);
```

---

## 10. Delete with RETURNING (PostgreSQL)

```sql
DELETE FROM Organization
WHERE id = 1
RETURNING *;
```

---

# Recommended Learning Order

| No. | Topic                            | Level             |
| --- | -------------------------------- | ----------------- |
| 1   | Delete a Single Row              | ⭐ Beginner       |
| 2   | Delete Multiple Rows             | ⭐ Beginner       |
| 3   | Delete All Rows                  | ⭐ Beginner       |
| 4   | Delete Using Multiple Conditions | ⭐⭐ Intermediate |
| 5   | Delete Using `IN`                | ⭐⭐ Intermediate |
| 6   | Delete Using `BETWEEN`           | ⭐⭐ Intermediate |
| 7   | Delete Using `LIKE`              | ⭐⭐ Intermediate |
| 8   | Delete Using `EXISTS`            | ⭐⭐⭐ Advanced   |
| 9   | Delete Using a Subquery          | ⭐⭐⭐ Advanced   |
| 10  | `RETURNING` Clause (PostgreSQL)  | ⭐⭐⭐ Advanced   |

### Notes

- `DELETE` removes **rows (records)** from a table.
- Always use a `WHERE` clause unless you intend to delete **all rows**.
- `DELETE` removes data **one row at a time** and can be **rolled back** until the transaction is committed.
- To remove **all rows more efficiently**, use `TRUNCATE TABLE`.
- `RETURNING` is a PostgreSQL feature that returns the deleted rows.
