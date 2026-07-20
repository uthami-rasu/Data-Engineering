Absolutely. Here are **progressive PostgreSQL Date & Time tasks** that collectively cover almost every commonly used date/time function.

---

# Task 1: Current Date & Time

**Table**

```sql
employee
---------
id
name
joined_date
```

### Questions

1. Display today's date.
2. Display the current timestamp.
3. Display the current time.
4. Display the current date and time in UTC.
5. Show today's date along with the employee name.

**Functions**

- `CURRENT_DATE`
- `CURRENT_TIME`
- `CURRENT_TIMESTAMP`
- `NOW()`
- `AT TIME ZONE`

---

# Task 2: Extract Parts of Date

```sql
orders
---------
order_id
order_date
amount
```

### Questions

1. Extract the year.
2. Extract the month.
3. Extract the day.
4. Extract the week number.
5. Extract the quarter.
6. Extract the hour.
7. Extract the minute.
8. Extract the day of the week.
9. Extract the day of the year.

**Functions**

- `EXTRACT()`
- `DATE_PART()`

---

# Task 3: Formatting Dates

```sql
employee
------------
id
name
joined_date
```

### Questions

Display the joining date as

```
20-Jul-2026
Monday
July
2026-07
20/07/2026
```

**Function**

```sql
TO_CHAR()
```

---

# Task 4: Date Arithmetic

```sql
subscription
---------------
id
start_date
```

### Questions

1. Add 30 days.
2. Add 6 months.
3. Add 1 year.
4. Subtract 15 days.
5. Find the date after 100 days.

**Topics**

- `INTERVAL`
- `+`
- `-`

---

# Task 5: Difference Between Dates

```sql
employee
-----------
joined_date
```

### Questions

1. How many days has each employee worked?
2. How many months?
3. How many years?
4. Which employee joined longest ago?

**Functions**

- `AGE()`
- Date subtraction

---

# Task 6: DATE_TRUNC()

```sql
sales
----------
sale_date
amount
```

### Questions

Display

1. Beginning of hour
2. Beginning of day
3. Beginning of week
4. Beginning of month
5. Beginning of quarter
6. Beginning of year

**Function**

```sql
DATE_TRUNC()
```

---

# Task 7: Group By Month

```sql
sales
--------
sale_date
amount
```

### Questions

1. Monthly sales.
2. Quarterly sales.
3. Weekly sales.
4. Daily sales.
5. Yearly sales.

**Functions**

- `DATE_TRUNC()`
- `EXTRACT()`

---

# Task 8: Age Calculation

```sql
customer
-------------
dob
```

### Questions

1. Calculate age.
2. Find customers older than 30.
3. Find customers younger than 18.
4. Display age in years and months.

**Function**

```sql
AGE()
```

---

# Task 9: Date Filtering

```sql
orders
-----------
order_date
```

### Questions

Find

1. Orders placed today.
2. Yesterday.
3. Last 7 days.
4. Last 30 days.
5. Current month.
6. Previous month.
7. Current year.
8. Previous year.

---

# Task 10: TO_DATE()

```sql
import_orders
-----------------
order_date_text
```

Values

```
20-07-2026
15-01-2025
```

### Questions

Convert these strings into dates.

**Function**

```sql
TO_DATE()
```

---

# Task 11: TO_TIMESTAMP()

```sql
logs
---------
log_time
```

Values

```
2026-07-20 10:30:45
```

### Questions

Convert strings into timestamps.

**Function**

```sql
TO_TIMESTAMP()
```

---

# Task 12: Generate Calendar

### Questions

Generate

1. Every day in July 2026.
2. Every Monday in 2026.
3. Every first day of each month.

**Function**

```sql
GENERATE_SERIES()
```

---

# Task 13: End of Month

```sql
orders
----------
order_date
```

### Questions

Find

1. Last day of month.
2. First day of month.
3. Next month's first day.
4. Previous month's last day.

**Functions**

- `DATE_TRUNC()`
- `INTERVAL`

---

# Task 14: Business Report

```sql
sales
----------
sale_date
amount
```

Generate a report containing

- Year
- Quarter
- Month
- Month Name
- Week Number
- Day Name
- Day Number
- Total Sales

**Functions**

- `EXTRACT()`
- `TO_CHAR()`
- `GROUP BY`

---

# Task 15 (Final Challenge): Employee HR Report

## Tables

### employee

```text
id
name
department
dob
joined_date
salary
```

### Requirements

Write a single query that returns:

- Employee name
- Age
- Years of service
- Joining month name
- Joining quarter
- Joining year
- Day joined
- Week joined
- Month start
- Month end
- Next work anniversary
- Days until next anniversary
- Current timestamp
- Joining date formatted as `20-Jul-2026`
- Whether the employee joined in the current year
- Whether the employee has completed 5 years of service
- Employee tenure bucket:
  - `< 1 year`
  - `1–3 years`
  - `3–5 years`
  - `> 5 years`

---

## Functions Covered

By completing these tasks, you'll practice nearly all important PostgreSQL date/time functions and concepts:

| Function / Concept           | Covered |
| ---------------------------- | ------- |
| `CURRENT_DATE`               | ✅      |
| `CURRENT_TIME`               | ✅      |
| `CURRENT_TIMESTAMP`          | ✅      |
| `NOW()`                      | ✅      |
| `EXTRACT()`                  | ✅      |
| `DATE_PART()`                | ✅      |
| `TO_CHAR()`                  | ✅      |
| `TO_DATE()`                  | ✅      |
| `TO_TIMESTAMP()`             | ✅      |
| `AGE()`                      | ✅      |
| `DATE_TRUNC()`               | ✅      |
| `INTERVAL`                   | ✅      |
| Date arithmetic (`+`, `-`)   | ✅      |
| Date subtraction             | ✅      |
| `GENERATE_SERIES()`          | ✅      |
| `AT TIME ZONE`               | ✅      |
| `GROUP BY` with dates        | ✅      |
| Date filtering               | ✅      |
| Month/quarter/year reporting | ✅      |
| Business date calculations   | ✅      |

These 15 tasks provide comprehensive practice with PostgreSQL date and time operations, from fundamentals to real-world reporting scenarios.
