Absolutely. Window Functions are one of the most important SQL concepts for Data Engineering interviews. I'll explain them from first principles, because once you understand **what the window actually is**, every window function becomes easy.

---

# What is a Window Function?

A **window function** performs a calculation across a set of rows that are related to the current row **without collapsing rows**.

Unlike `GROUP BY`, every row is still returned.

Example Table

| id  | name | salary |
| --- | ---- | ------ |
| 1   | A    | 1000   |
| 2   | B    | 2000   |
| 3   | C    | 3000   |

If we do

```sql
SELECT AVG(salary)
FROM employee;
```

Output

| avg  |
| ---- |
| 2000 |

Only one row.

But with a window function

```sql
SELECT
    name,
    salary,
    AVG(salary) OVER ()
FROM employee;
```

Output

| name | salary | avg  |
| ---- | ------ | ---- |
| A    | 1000   | 2000 |
| B    | 2000   | 2000 |
| C    | 3000   | 2000 |

Every row remains.

This is the biggest difference.

---

# General Syntax

```sql
window_function(expression)
OVER (
    PARTITION BY ...
    ORDER BY ...
    window_frame
)
```

Everything inside `OVER()` defines the **window**.

Think of it like

```
OVER(
    PARTITION
    ORDER
    FRAME
)
```

These three define **which rows the function can see**.

---

# What is a Window?

Think of every row standing in a room.

For each current row PostgreSQL asks

> Which rows are visible to this row?

Those visible rows are called the **window**.

Example

```
Employee

A 1000
B 2000
C 3000
D 4000
```

For current row C

Possible windows

```
Entire table

A
B
C   <- current row
D
```

or

```
Only department

A
B
C
```

or

```
Only previous rows

A
B
C
```

or

```
Only current row

C
```

Window functions always work on the rows visible inside that window.

---

# Components of a Window

```
OVER(
    PARTITION BY
    ORDER BY
    WINDOW FRAME
)
```

These three are independent.

---

# 1. PARTITION BY

Partitions divide data into groups.

Similar to GROUP BY

But rows are NOT collapsed.

Example

| dept | emp | salary |
| ---- | --- | ------ |
| HR   | A   | 1000   |
| HR   | B   | 2000   |
| IT   | C   | 5000   |
| IT   | D   | 6000   |

Query

```sql
AVG(salary)
OVER(PARTITION BY dept)
```

Result

| dept | salary | avg  |
| ---- | ------ | ---- |
| HR   | 1000   | 1500 |
| HR   | 2000   | 1500 |
| IT   | 5000   | 5500 |
| IT   | 6000   | 5500 |

Each department has its own window.

---

# 2. ORDER BY

Ordering decides

> In which sequence should rows be processed?

Example

```
1000
3000
2000
```

After

```sql
ORDER BY salary
```

```
1000
2000
3000
```

Many window functions depend on ordering.

Examples

- ROW_NUMBER
- RANK
- LEAD
- LAG
- FIRST_VALUE
- LAST_VALUE
- Running SUM

Without ordering they don't know what comes before or after.

---

# 3. Window Frame

This is the most confusing part.

People think

Partition = Window

Actually

```
Partition
    ↓

Entire department

A
B
C
D
E
```

Frame

```
Only

A
B
C
```

Frame is a **subset** of the partition.

---

# Window Hierarchy

```
Entire Table

↓

Partition

↓

Frame

↓

Current Row
```

Example

```
IT Department

A
B
C
D
E
```

Current row = C

Possible frames

```
A
B
C
```

or

```
B
C
D
```

or

```
C
```

Frame changes for every current row.

---

# Default Window Frame

This depends on whether `ORDER BY` exists.

---

## Case 1

No ORDER BY

```sql
SUM(salary)
OVER()
```

Default frame

```
Entire partition
```

Equivalent to

```sql
ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
```

Every row sees

```
A
B
C
D
```

---

## Case 2

ORDER BY exists

```sql
SUM(salary)
OVER(
ORDER BY salary
)
```

Default becomes

```sql
RANGE BETWEEN UNBOUNDED PRECEDING
AND CURRENT ROW
```

Meaning

```
Beginning

↓

Current Row
```

Example

```
1000
2000
3000
4000
```

For row

3000

Visible rows

```
1000
2000
3000
```

Not

```
4000
```

This creates a running total.

---

Example

```sql
SELECT
salary,
SUM(salary)
OVER(ORDER BY salary)
FROM employee;
```

Result

| salary | sum   |
| ------ | ----- |
| 1000   | 1000  |
| 2000   | 3000  |
| 3000   | 6000  |
| 4000   | 10000 |

---

# Window Frame Controls

Frames can be controlled using

```
ROWS
RANGE
GROUPS
```

These define how the frame is measured.

---

## ROWS

Counts physical rows.

```
ROWS BETWEEN 2 PRECEDING
AND CURRENT ROW
```

Means

Take previous 2 rows.

Example

```
10
20
30
40
50
```

Current row

40

Frame

```
20
30
40
```

---

## RANGE

Counts value ranges.

Example

```
Salary

1000
1000
2000
3000
```

```
RANGE
```

Includes all peer rows having the same ORDER BY value.

Different from ROWS.

---

## GROUPS

Counts peer groups.

Peer group

Rows with same ORDER BY value.

Example

```
1000
1000
1000
2000
3000
3000
```

Groups

```
Group1

1000
1000
1000

Group2

2000

Group3

3000
3000
```

Useful when duplicate ORDER BY values matter.

---

# Frame Boundaries

Possible boundaries

```
UNBOUNDED PRECEDING

3 PRECEDING

1 PRECEDING

CURRENT ROW

1 FOLLOWING

3 FOLLOWING

UNBOUNDED FOLLOWING
```

Examples

---

Current row only

```sql
ROWS BETWEEN CURRENT ROW
AND CURRENT ROW
```

---

Previous row + current row

```sql
ROWS BETWEEN 1 PRECEDING
AND CURRENT ROW
```

---

Current + next row

```sql
ROWS BETWEEN CURRENT ROW
AND 1 FOLLOWING
```

---

Entire partition

```sql
ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
```

---

# Which Functions Use Window Frames?

Not every window function pays attention to the frame. Here's the practical breakdown:

| Function Category | Examples                                                                             | Uses PARTITION | Uses ORDER            | Uses FRAME |
| ----------------- | ------------------------------------------------------------------------------------ | -------------- | --------------------- | ---------- |
| Ranking           | `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `PERCENT_RANK()`, `CUME_DIST()`, `NTILE()` | ✅             | ✅ (usually required) | ❌         |
| Offset            | `LEAD()`, `LAG()`                                                                    | ✅             | ✅                    | ❌         |
| Aggregate         | `SUM()`, `AVG()`, `COUNT()`, `MIN()`, `MAX()`                                        | ✅             | Optional              | ✅         |
| Value             | `FIRST_VALUE()`, `LAST_VALUE()`, `NTH_VALUE()`                                       | ✅             | ✅                    | ✅         |

**Important notes:**

- Aggregate window functions (`SUM`, `AVG`, etc.) use the frame to decide which rows to aggregate.
- `FIRST_VALUE`, `LAST_VALUE`, and `NTH_VALUE` also depend on the frame. In particular, `LAST_VALUE()` often surprises people because, with the default frame, it returns the current row's value rather than the last value in the partition.
- Ranking and offset functions ignore the frame. They work over the ordered partition, not the frame.

---

# Named Windows (Window Controls Reuse)

If multiple functions use the same window specification, you can define it once with the `WINDOW` clause.

```sql
SELECT
    emp_name,
    salary,
    SUM(salary) OVER w AS running_total,
    AVG(salary) OVER w AS running_avg
FROM employee
WINDOW w AS (
    PARTITION BY dept
    ORDER BY salary
);
```

This avoids repeating the same `OVER (...)` definition.

---

# Summary

```
Window
    │
    ├── PARTITION BY
    │       Divide data into independent groups
    │
    ├── ORDER BY
    │       Define row sequence within each partition
    │
    └── FRAME
            Define exactly which rows are visible to the current row
```

Think of it as a hierarchy:

```
Entire Table
      ↓
Partition
      ↓
Ordered Rows
      ↓
Frame
      ↓
Current Row
```

Once this model is clear, all PostgreSQL window functions become much easier to understand. The next step is to learn each family in detail: ranking functions, aggregate window functions, offset functions (`LEAD`/`LAG`), value functions (`FIRST_VALUE`, `LAST_VALUE`, `NTH_VALUE`), and advanced frame specifications (`ROWS`, `RANGE`, and `GROUPS`) with practical examples.
