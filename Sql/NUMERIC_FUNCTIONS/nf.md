Here are the **most commonly used PostgreSQL Numeric Functions**, along with syntax and examples.

---

# 1. `ABS()`

Returns the absolute value.

```sql
SELECT ABS(-25);
```

**Output**

```text
25
```

---

# 2. `CEIL()` / `CEILING()`

Rounds up to the nearest integer.

```sql
SELECT CEIL(12.3);
```

**Output**

```text
13
```

---

# 3. `FLOOR()`

Rounds down to the nearest integer.

```sql
SELECT FLOOR(12.9);
```

**Output**

```text
12
```

---

# 4. `ROUND()`

Rounds to the nearest value.

```sql
SELECT ROUND(12.567);
```

**Output**

```text
13
```

With decimal places:

```sql
SELECT ROUND(12.5678, 2);
```

**Output**

```text
12.57
```

---

# 5. `TRUNC()`

Removes decimal places without rounding.

```sql
SELECT TRUNC(12.987, 2);
```

**Output**

```text
12.98
```

---

# 6. `MOD()`

Returns the remainder.

```sql
SELECT MOD(17, 5);
```

**Output**

```text
2
```

---

# 7. `POWER()`

Raises a number to a power.

```sql
SELECT POWER(2, 5);
```

**Output**

```text
32
```

---

# 8. `SQRT()`

Returns the square root.

```sql
SELECT SQRT(144);
```

**Output**

```text
12
```

---

# 9. `CBRT()`

Returns the cube root.

```sql
SELECT CBRT(27);
```

**Output**

```text
3
```

---

# 10. `EXP()`

Returns (e^x).

```sql
SELECT EXP(2);
```

---

# 11. `LN()`

Natural logarithm.

```sql
SELECT LN(10);
```

---

# 12. `LOG()`

Base-10 logarithm.

```sql
SELECT LOG(100);
```

**Output**

```text
2
```

---

# 13. `PI()`

Returns π.

```sql
SELECT PI();
```

---

# 14. `RANDOM()`

Returns a random value between 0 and 1.

```sql
SELECT RANDOM();
```

---

# 15. `SIGN()`

Returns the sign of a number.

```sql
SELECT SIGN(-50);
```

**Output**

```text
-1
```

---

# 16. `GREATEST()`

Returns the largest value.

```sql
SELECT GREATEST(10, 25, 7, 18);
```

**Output**

```text
25
```

---

# 17. `LEAST()`

Returns the smallest value.

```sql
SELECT LEAST(10, 25, 7, 18);
```

**Output**

```text
7
```

---

# 18. `FACTORIAL()`

Returns factorial.

```sql
SELECT FACTORIAL(5);
```

**Output**

```text
120
```

---

# 19. `WIDTH_BUCKET()`

Places a number into a bucket.

```sql
SELECT WIDTH_BUCKET(45, 0, 100, 5);
```

---

# 20. `DIV()`

PostgreSQL doesn't have a `DIV()` function, but integer division achieves the same effect.

```sql
SELECT 17 / 5;
```

Result (integer division):

```text
3
```

```sql
SELECT 17.0 / 5;
```

Result:

```text
3.4
```

---

# Numeric Operators

| Operator | Description    | Example  |
| -------- | -------------- | -------- |
| `+`      | Addition       | `10 + 5` |
| `-`      | Subtraction    | `10 - 5` |
| `*`      | Multiplication | `10 * 5` |
| `/`      | Division       | `10 / 5` |
| `%`      | Modulus        | `10 % 3` |
| `^`      | Exponent       | `2 ^ 3`  |

---

# Functions Most Asked in Interviews

| Function     | Purpose                     |
| ------------ | --------------------------- |
| `ABS()`      | Absolute value              |
| `ROUND()`    | Round numbers               |
| `TRUNC()`    | Truncate decimals           |
| `CEIL()`     | Round up                    |
| `FLOOR()`    | Round down                  |
| `MOD()`      | Remainder                   |
| `POWER()`    | Exponentiation              |
| `SQRT()`     | Square root                 |
| `RANDOM()`   | Generate random numbers     |
| `SIGN()`     | Positive/negative indicator |
| `GREATEST()` | Largest value               |
| `LEAST()`    | Smallest value              |

These functions cover the vast majority of numeric operations you'll use in PostgreSQL for calculations, reporting, and interview questions.
