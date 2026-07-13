Besides **Regex operators**, PostgreSQL has many categories of operators. Here's a concise cheat sheet.

# PostgreSQL Operators

| Category             | Operators                                     | Purpose                          |                     |              |
| -------------------- | --------------------------------------------- | -------------------------------- | ------------------- | ------------ |
| Arithmetic           | `+`, `-`, `*`, `/`, `%`, `^`                  | Mathematical calculations        |                     |              |
| Comparison           | `=`, `!=`, `<>`, `>`, `<`, `>=`, `<=`         | Compare values                   |                     |              |
| Logical              | `AND`, `OR`, `NOT`                            | Combine conditions               |                     |              |
| Pattern Matching     | `LIKE`, `ILIKE`, `SIMILAR TO`                 | Match text patterns              |                     |              |
| Regular Expression   | `~`, `~*`, `!~`, `!~*`                        | Regex matching                   |                     |              |
| Range                | `BETWEEN`, `NOT BETWEEN`                      | Check value within a range       |                     |              |
| Membership           | `IN`, `NOT IN`                                | Check if value exists in a list  |                     |              |
| Null Check           | `IS NULL`, `IS NOT NULL`                      | Check NULL values                |                     |              |
| Boolean              | `IS TRUE`, `IS FALSE`, `IS UNKNOWN`           | Boolean comparisons              |                     |              |
| Existence            | `EXISTS`, `NOT EXISTS`                        | Check if subquery returns rows   |                     |              |
| JSON/JSONB           | `->`, `->>`, `#>`, `#>>`, `@>`, `<@`, `?`, `? | `, `?&`                          | Work with JSON data |              |
| Array                | `ANY`, `ALL`, `&&`, `@>`, `<@`                | Work with arrays                 |                     |              |
| String Concatenation | `                                             |                                  | `                   | Join strings |
| Bitwise              | `&`, `                                        | `, `#`, `<<`, `>>`, `~`          | Bit operations      |              |
| Type Cast            | `::`                                          | Convert one data type to another |                     |              |

---

# 1. Arithmetic Operators

| Operator | Description    | Example  |
| -------- | -------------- | -------- |
| `+`      | Addition       | `10 + 5` |
| `-`      | Subtraction    | `10 - 5` |
| `*`      | Multiplication | `10 * 5` |
| `/`      | Division       | `10 / 5` |
| `%`      | Modulus        | `10 % 3` |
| `^`      | Power          | `2 ^ 3`  |

---

# 2. Comparison Operators

| Operator | Description           |
| -------- | --------------------- |
| `=`      | Equal                 |
| `!=`     | Not Equal             |
| `<>`     | Not Equal             |
| `>`      | Greater Than          |
| `<`      | Less Than             |
| `>=`     | Greater Than or Equal |
| `<=`     | Less Than or Equal    |

---

# 3. Logical Operators

| Operator | Description                         |
| -------- | ----------------------------------- |
| `AND`    | Both conditions must be true        |
| `OR`     | At least one condition must be true |
| `NOT`    | Negates a condition                 |

---

# 4. Pattern Matching Operators

| Operator     | Case Sensitive | Example                 |          |
| ------------ | :------------: | ----------------------- | -------- |
| `LIKE`       |       ✅       | `name LIKE 'A%'`        |          |
| `ILIKE`      |       ❌       | `name ILIKE 'a%'`       |          |
| `SIMILAR TO` |       ✅       | `name SIMILAR TO '(John | Alice)'` |

---

# 5. Regex Operators

| Operator | Description                   |
| -------- | ----------------------------- |
| `~`      | Regex Match                   |
| `~*`     | Regex Match (Ignore Case)     |
| `!~`     | Regex NOT Match               |
| `!~*`    | Regex NOT Match (Ignore Case) |

---

# 6. Membership Operators

| Operator | Description            |
| -------- | ---------------------- |
| `IN`     | Exists in list         |
| `NOT IN` | Does not exist in list |

Example:

```sql
WHERE department IN ('HR','IT','Finance');
```

---

# 7. Range Operators

| Operator      | Description     |
| ------------- | --------------- |
| `BETWEEN`     | Inclusive range |
| `NOT BETWEEN` | Outside range   |

Example:

```sql
salary BETWEEN 50000 AND 100000
```

---

# 8. NULL Operators

| Operator      | Description       |
| ------------- | ----------------- |
| `IS NULL`     | Value is NULL     |
| `IS NOT NULL` | Value is not NULL |

---

# 9. EXISTS Operators

| Operator     | Description              |
| ------------ | ------------------------ |
| `EXISTS`     | Subquery returns rows    |
| `NOT EXISTS` | Subquery returns no rows |

---

# 10. String Operator

| Operator | Description | Example |                     |          |     |           |
| -------- | ----------- | ------- | ------------------- | -------- | --- | --------- |
| `        |             | `       | Concatenate strings | `'Hello' |     | ' World'` |

---

# 11. JSON Operators

| Operator | Description            |                |
| -------- | ---------------------- | -------------- |
| `->`     | Get JSON object        |                |
| `->>`    | Get JSON value as text |                |
| `#>`     | Get nested JSON object |                |
| `#>>`    | Get nested JSON text   |                |
| `@>`     | JSON contains          |                |
| `<@`     | JSON is contained in   |                |
| `?`      | Key exists             |                |
| `?       | `                      | Any key exists |
| `?&`     | All keys exist         |                |

---

# 12. Array Operators

| Operator | Description           |
| -------- | --------------------- |
| `ANY`    | Matches any element   |
| `ALL`    | Matches all elements  |
| `&&`     | Arrays overlap        |
| `@>`     | Array contains        |
| `<@`     | Array is contained in |

---

# 13. Bitwise Operators

| Operator | Description |     |
| -------- | ----------- | --- |
| `&`      | AND         |     |
| `        | `           | OR  |
| `#`      | XOR         |     |
| `~`      | NOT         |     |
| `<<`     | Left Shift  |     |
| `>>`     | Right Shift |     |

---

# 14. Type Casting

| Operator | Description       | Example          |
| -------- | ----------------- | ---------------- |
| `::`     | Convert data type | `'100'::INTEGER` |

---

## 📌 Most Commonly Used in SQL Interviews

| Category             |                       Frequently Asked                       |     |        |
| -------------------- | :----------------------------------------------------------: | --- | ------ |
| Comparison Operators |                          ⭐⭐⭐⭐⭐                          |     |        |
| Logical Operators    |                          ⭐⭐⭐⭐⭐                          |     |        |
| Arithmetic Operators |                          ⭐⭐⭐⭐⭐                          |     |        |
| `IN`, `NOT IN`       |                          ⭐⭐⭐⭐⭐                          |     |        |
| `BETWEEN`            |                           ⭐⭐⭐⭐                           |     |        |
| `LIKE`, `ILIKE`      |                          ⭐⭐⭐⭐⭐                          |     |        |
| Regex (`~`, `~*`)    |                           ⭐⭐⭐⭐                           |     |        |
| `IS NULL`            |                          ⭐⭐⭐⭐⭐                          |     |        |
| `EXISTS`             |                           ⭐⭐⭐⭐                           |     |        |
| `ANY`, `ALL`         |                            ⭐⭐⭐                            |     |        |
| `                    |                                                              | `   | ⭐⭐⭐ |
| JSON Operators       | ⭐⭐⭐⭐ (especially for backend and data engineering roles) |     |        |
