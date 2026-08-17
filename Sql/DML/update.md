For DML, these are the **most common types of `UPDATE`** statements you should know.

```sql
-- ============================================================
-- UPDATE
-- ============================================================

-- Syntax

UPDATE table_name
SET column_name = value
WHERE condition;
```

---

## 1. Update a Single Column

```sql
UPDATE Organization
SET amount = 50000
WHERE id = 1;
```

---

## 2. Update Multiple Columns

```sql
UPDATE Organization
SET
    amount = 60000,
    status = 'ACTIVE',
    type = 'PRIVATE'
WHERE id = 1;
```

---

## 3. Update All Rows

> **No WHERE clause**

```sql
UPDATE Organization
SET status = 'ACTIVE';
```

---

## 4. Update Using a Condition

```sql
UPDATE Organization
SET payment_count = 10
WHERE amount > 30000;
```

---

## 5. Update Using Expressions

```sql
UPDATE Organization
SET amount = amount + 5000
WHERE id = 1;
```

---

## 6. Update Using NULL

```sql
UPDATE Organization
SET payment_at = NULL
WHERE id = 1;
```

---

## 7. Update Multiple Rows

```sql
UPDATE Organization
SET status = 'INACTIVE'
WHERE type = 'PRIVATE';
```

---

## 8. Update Using Another Table

```sql
UPDATE employees e
SET salary = s.salary
FROM salary_updates s
WHERE e.id = s.id;
```

---

## 9. Update Using a Subquery

```sql
UPDATE Organization
SET amount = (
    SELECT MAX(amount)
    FROM Organization
)
WHERE id = 1;
```

---

## 10. Update with RETURNING (PostgreSQL)

```sql
UPDATE Organization
SET status = 'ACTIVE'
WHERE id = 1
RETURNING *;
```

---

# Recommended learning order

| No. | Topic                               | Beginner/Advanced |
| --- | ----------------------------------- | ----------------- |
| 1   | Update Single Column                | ⭐ Beginner       |
| 2   | Update Multiple Columns             | ⭐ Beginner       |
| 3   | Update All Rows                     | ⭐ Beginner       |
| 4   | Update Using WHERE                  | ⭐ Beginner       |
| 5   | Update Using Expressions            | ⭐⭐ Intermediate |
| 6   | Update Using NULL                   | ⭐⭐ Intermediate |
| 7   | Update Multiple Rows                | ⭐⭐ Intermediate |
| 8   | Update Using Another Table (`FROM`) | ⭐⭐⭐ Advanced   |
| 9   | Update Using Subquery               | ⭐⭐⭐ Advanced   |
| 10  | `RETURNING` Clause (PostgreSQL)     | ⭐⭐⭐ Advanced   |

These 10 patterns cover almost everything you'll encounter in PostgreSQL interviews and day-to-day development.
