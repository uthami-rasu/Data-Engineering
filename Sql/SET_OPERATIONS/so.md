If you're learning SQL in order, here's a practical guide to **set operations** in PostgreSQL.

# Set Operations Roadmap

```
Set Operations
│
├── UNION
├── UNION ALL
├── INTERSECT
├── INTERSECT ALL
├── EXCEPT
└── EXCEPT ALL
```

---

# 1. UNION

**Purpose:** Combine two result sets and remove duplicates.

```sql
SELECT name FROM employees
UNION
SELECT name FROM customers;
```

Example:

**Employees**

| name  |
| ----- |
| John  |
| Alice |

**Customers**

| name  |
| ----- |
| Alice |
| David |

Result:

| name  |
| ----- |
| Alice |
| David |
| John  |

---

# 2. UNION ALL

**Purpose:** Combine two result sets and keep duplicates.

```sql
SELECT name FROM employees
UNION ALL
SELECT name FROM customers;
```

Result:

| name  |
| ----- |
| John  |
| Alice |
| Alice |
| David |

---

# 3. INTERSECT

**Purpose:** Return only rows present in both queries.

```sql
SELECT name FROM employees
INTERSECT
SELECT name FROM customers;
```

Result:

| name  |
| ----- |
| Alice |

Think of it as the **common rows**.

---

# 4. INTERSECT ALL

Returns common rows **including duplicate occurrences**.

Example:

Table A

```
John
John
Alice
```

Table B

```
John
John
John
Alice
```

```sql
SELECT name FROM A
INTERSECT ALL
SELECT name FROM B;
```

Result

```
John
John
Alice
```

The number of duplicates returned is the **minimum count** found in both sets.

---

# 5. EXCEPT

Returns rows from the first query that are **not** in the second.

```sql
SELECT name FROM employees
EXCEPT
SELECT name FROM customers;
```

Result

| name |
| ---- |
| John |

Think of it as **A − B**.

---

# 6. EXCEPT ALL

Like `EXCEPT`, but preserves duplicate counts.

Example:

A

```
John
John
Alice
```

B

```
John
```

```sql
SELECT name FROM A
EXCEPT ALL
SELECT name FROM B;
```

Result

```
John
Alice
```

One `John` is removed, but the other remains.

---

# Visual Summary

```
Employees              Customers

John                   Alice
Alice                  David
Bob                    Bob
```

### UNION

```
John
Alice
Bob
David
```

---

### UNION ALL

```
John
Alice
Bob
Alice
David
Bob
```

---

### INTERSECT

```
Alice
Bob
```

---

### EXCEPT

```
John
```

---

# Rules

Both queries must:

- Return the same number of columns.
- Have compatible data types.
- Use `ORDER BY` only once at the end of the combined query.

Example:

```sql
SELECT id, name
FROM employees

UNION

SELECT customer_id, customer_name
FROM customers

ORDER BY name;
```

---

# Performance

| Operation     | Removes Duplicates | Faster                                |
| ------------- | ------------------ | ------------------------------------- |
| UNION         | ✅                 | ❌                                    |
| UNION ALL     | ❌                 | ✅                                    |
| INTERSECT     | ✅                 | Moderate                              |
| INTERSECT ALL | ❌                 | Faster than `INTERSECT` in some cases |
| EXCEPT        | ✅                 | Moderate                              |
| EXCEPT ALL    | ❌                 | Faster than `EXCEPT` in some cases    |

---

# When to Use

- **UNION** → Merge two result sets without duplicates.
- **UNION ALL** → Merge two result sets and keep all rows.
- **INTERSECT** → Find common records.
- **EXCEPT** → Find records in one result set but not the other.

---

# Learning Order

I recommend studying them in this sequence:

1. ✅ `UNION`
2. ✅ `UNION ALL`
3. ✅ `INTERSECT`
4. ✅ `EXCEPT`
5. ✅ `INTERSECT ALL`
6. ✅ `EXCEPT ALL`

This order builds naturally from the simplest concepts to the less commonly used variants and matches how they're typically encountered in real-world SQL and interviews.
