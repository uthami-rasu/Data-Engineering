Here's a clean, concise format for your **TCL (Transaction Control Language)** notes that matches your DDL and DML style.

```sql
-- ============================================================
-- TCL (Transaction Control Language)
-- ============================================================

/*
TCL Commands

1. BEGIN (or START TRANSACTION)
2. COMMIT
3. ROLLBACK
4. SAVEPOINT
5. RELEASE SAVEPOINT

Notes:
- TCL commands are used to manage transactions.
- A transaction is a group of one or more SQL statements
  executed as a single unit of work.
- TCL is mainly used with DML commands (INSERT, UPDATE, DELETE).
- DDL commands usually perform an implicit COMMIT in PostgreSQL,
  so they cannot be rolled back once executed.
*/
```

---

## 1. BEGIN TRANSACTION

```sql
BEGIN;

UPDATE Organization
SET amount = 50000
WHERE id = 1;
```

Starts a new transaction.

---

## 2. COMMIT

```sql
BEGIN;

UPDATE Organization
SET amount = 50000
WHERE id = 1;

COMMIT;
```

Permanently saves all changes made in the transaction.

---

## 3. ROLLBACK

```sql
BEGIN;

UPDATE Organization
SET amount = 50000
WHERE id = 1;

ROLLBACK;
```

Undoes all changes made since the transaction began.

---

## 4. SAVEPOINT

```sql
BEGIN;

UPDATE Organization
SET amount = 50000
WHERE id = 1;

SAVEPOINT sp1;

UPDATE Organization
SET status = 'ACTIVE'
WHERE id = 1;

ROLLBACK TO SAVEPOINT sp1;

COMMIT;
```

Creates a point within a transaction that you can roll back to.

---

## 5. RELEASE SAVEPOINT

```sql
BEGIN;

SAVEPOINT sp1;

UPDATE Organization
SET amount = 50000
WHERE id = 1;

RELEASE SAVEPOINT sp1;

COMMIT;
```

Removes a savepoint after it is no longer needed.

---

# Recommended Learning Order

| No. | Topic             | Level             |
| --- | ----------------- | ----------------- |
| 1   | BEGIN Transaction | ⭐ Beginner       |
| 2   | COMMIT            | ⭐ Beginner       |
| 3   | ROLLBACK          | ⭐ Beginner       |
| 4   | SAVEPOINT         | ⭐⭐ Intermediate |
| 5   | RELEASE SAVEPOINT | ⭐⭐ Intermediate |

---

## Easy way to remember

| Command                 | Purpose                                    |
| ----------------------- | ------------------------------------------ |
| `BEGIN`                 | Start a transaction                        |
| `COMMIT`                | Save all changes permanently               |
| `ROLLBACK`              | Undo all changes                           |
| `SAVEPOINT`             | Create a checkpoint within a transaction   |
| `ROLLBACK TO SAVEPOINT` | Undo changes back to a specific checkpoint |
| `RELEASE SAVEPOINT`     | Remove a savepoint                         |

> **Note (PostgreSQL):** `BEGIN` and `START TRANSACTION` are equivalent. `BEGIN` is the more commonly used syntax.
