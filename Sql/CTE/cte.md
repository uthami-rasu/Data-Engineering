Got it. You mean **only the window functions**, not `PARTITION BY`, `ORDER BY`, or window frames.

This is the cheat sheet I recommend for Data Engineering interviews.

---

# PostgreSQL Window Functions Cheat Sheet

| Function        | Purpose                    | Syntax                                    | Example Use Case                 |
| --------------- | -------------------------- | ----------------------------------------- | -------------------------------- |
| `ROW_NUMBER()`  | Unique sequential number   | `ROW_NUMBER() OVER(ORDER BY salary DESC)` | Top employee, remove duplicates  |
| `RANK()`        | Ranking with gaps          | `RANK() OVER(ORDER BY salary DESC)`       | Competition ranking              |
| `DENSE_RANK()`  | Ranking without gaps       | `DENSE_RANK() OVER(ORDER BY salary DESC)` | Top 3 salaries                   |
| `NTILE(n)`      | Divide rows into n buckets | `NTILE(4) OVER(ORDER BY salary)`          | Quartiles, customer segmentation |
| `LAG()`         | Previous row value         | `LAG(salary) OVER(ORDER BY id)`           | Compare with previous day/month  |
| `LEAD()`        | Next row value             | `LEAD(salary) OVER(ORDER BY id)`          | Next shipment, next salary       |
| `FIRST_VALUE()` | First value in window      | `FIRST_VALUE(salary) OVER(...)`           | Highest/lowest in a department   |
| `LAST_VALUE()`  | Last value in window       | `LAST_VALUE(salary) OVER(...)`            | Last record in partition         |
| `NTH_VALUE()`   | Nth value in window        | `NTH_VALUE(salary,3) OVER(...)`           | Third highest salary             |
| `SUM()`         | Running or partition total | `SUM(amount) OVER(...)`                   | Running sales                    |
| `AVG()`         | Running/partition average  | `AVG(amount) OVER(...)`                   | Moving average                   |
| `COUNT()`       | Running/partition count    | `COUNT(*) OVER(...)`                      | Running customer count           |
| `MIN()`         | Running/partition minimum  | `MIN(price) OVER(...)`                    | Lowest price so far              |
| `MAX()`         | Running/partition maximum  | `MAX(price) OVER(...)`                    | Highest price so far             |

---

# 1. ROW_NUMBER()

### Purpose

Assign a **unique number** to every row.

### Syntax

```sql
ROW_NUMBER()
OVER(
    PARTITION BY department
    ORDER BY salary DESC
)
```

### Example

| Emp | Salary | ROW_NUMBER |
| --- | ------ | ---------- |
| A   | 5000   | 1          |
| B   | 5000   | 2          |
| C   | 4000   | 3          |

### Common Interview Question

> Find the highest-paid employee in each department.

---

# 2. RANK()

### Purpose

Assign the **same rank to duplicates**.

Leaves gaps.

### Syntax

```sql
RANK()
OVER(
    ORDER BY salary DESC
)
```

### Example

| Salary | Rank |
| ------ | ---- |
| 5000   | 1    |
| 5000   | 1    |
| 4000   | 3    |

### Common Interview Question

> Rank students by marks.

---

# 3. DENSE_RANK()

### Purpose

Same rank for duplicates.

No gaps.

### Syntax

```sql
DENSE_RANK()
OVER(
ORDER BY salary DESC
)
```

### Example

| Salary | Dense Rank |
| ------ | ---------- |
| 5000   | 1          |
| 5000   | 1          |
| 4000   | 2          |

### Common Interview Question

> Find the Top 3 salaries.

---

# 4. NTILE()

### Purpose

Split rows into equal buckets.

### Syntax

```sql
NTILE(4)
OVER(
ORDER BY salary
)
```

### Example

20 employees

↓

Bucket1

Bucket2

Bucket3

Bucket4

### Common Interview Question

> Divide customers into four spending groups.

---

# 5. LAG()

### Purpose

Read previous row.

### Syntax

```sql
LAG(salary)
OVER(
ORDER BY salary
)
```

or

```sql
LAG(salary,2)
```

### Example

| Salary | Previous |
| ------ | -------- |
| 1000   | NULL     |
| 2000   | 1000     |
| 3000   | 2000     |

### Common Interview Question

> Compare today's sales with yesterday's sales.

---

# 6. LEAD()

### Purpose

Read next row.

### Syntax

```sql
LEAD(salary)
OVER(
ORDER BY salary
)
```

### Example

| Salary | Next |
| ------ | ---- |
| 1000   | 2000 |
| 2000   | 3000 |
| 3000   | NULL |

### Common Interview Question

> Show the next order date for each customer.

---

# 7. FIRST_VALUE()

### Purpose

Return the first value in the window.

### Syntax

```sql
FIRST_VALUE(salary)
OVER(
PARTITION BY department
ORDER BY salary DESC
)
```

### Example

| Dept | Salary | Highest Salary |
| ---- | ------ | -------------- |
| IT   | 7000   | 7000           |
| IT   | 5000   | 7000           |
| IT   | 4000   | 7000           |

### Common Interview Question

> Show the highest salary beside every employee.

---

# 8. LAST_VALUE()

### Purpose

Return last value.

### Syntax

```sql
LAST_VALUE(salary)
OVER(
ORDER BY salary
ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
)
```

### Example

| Salary | Last |
| ------ | ---- |
| 1000   | 5000 |
| 2000   | 5000 |
| 5000   | 5000 |

### Common Interview Question

> Show the last order date for every order.

---

# 9. NTH_VALUE()

### Purpose

Return nth value.

### Syntax

```sql
NTH_VALUE(salary,3)
OVER(
ORDER BY salary DESC
ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
)
```

### Example

| Salary | Third Highest |
| ------ | ------------- |
| 7000   | 5000          |
| 6000   | 5000          |
| 5000   | 5000          |

### Common Interview Question

> Find the third highest salary without a subquery.

---

# 10. SUM()

### Purpose

Running total or partition total.

### Syntax

```sql
SUM(amount)
OVER(
ORDER BY sale_date
)
```

### Example

| Day | Sales | Running Total |
| --- | ----- | ------------- |
| 1   | 100   | 100           |
| 2   | 200   | 300           |
| 3   | 150   | 450           |

### Common Interview Question

> Calculate cumulative sales.

---

# 11. AVG()

### Purpose

Running average.

### Syntax

```sql
AVG(amount)
OVER(
ORDER BY day
)
```

### Common Interview Question

> Running average temperature.

---

# 12. COUNT()

### Purpose

Running count.

### Syntax

```sql
COUNT(*)
OVER(
ORDER BY day
)
```

### Common Interview Question

> Running customer count.

---

# 13. MIN()

### Purpose

Minimum value seen so far.

### Syntax

```sql
MIN(price)
OVER(
ORDER BY id
)
```

### Common Interview Question

> Lowest stock price so far.

---

# 14. MAX()

### Purpose

Maximum value seen so far.

### Syntax

```sql
MAX(price)
OVER(
ORDER BY id
)
```

### Common Interview Question

> Highest temperature so far.

---

# Most Asked in Data Engineering Interviews ⭐⭐⭐⭐⭐

| Function        | Frequency  |
| --------------- | ---------- |
| `ROW_NUMBER()`  | ⭐⭐⭐⭐⭐ |
| `RANK()`        | ⭐⭐⭐⭐⭐ |
| `DENSE_RANK()`  | ⭐⭐⭐⭐⭐ |
| `LAG()`         | ⭐⭐⭐⭐⭐ |
| `LEAD()`        | ⭐⭐⭐⭐⭐ |
| `SUM()`         | ⭐⭐⭐⭐⭐ |
| `AVG()`         | ⭐⭐⭐⭐   |
| `COUNT()`       | ⭐⭐⭐⭐   |
| `FIRST_VALUE()` | ⭐⭐⭐     |
| `LAST_VALUE()`  | ⭐⭐⭐     |
| `NTILE()`       | ⭐⭐       |
| `NTH_VALUE()`   | ⭐⭐       |
| `MIN()`         | ⭐⭐       |
| `MAX()`         | ⭐⭐       |

If you master the **first seven functions** (`ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`, `LEAD`, `SUM`, and `AVG`), you'll be well prepared for the majority of SQL window function questions asked in Data Engineering interviews.
