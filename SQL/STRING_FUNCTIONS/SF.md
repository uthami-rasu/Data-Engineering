PostgreSQL provides a rich set of **string functions** for manipulating text. Below are the most commonly used ones with syntax and examples.

---

# 1. `LENGTH()`

Returns the number of characters.

```sql
SELECT LENGTH('PostgreSQL');
```

**Output**

```text
10
```

---

# 2. `UPPER()`

Converts text to uppercase.

```sql
SELECT UPPER('hello');
```

**Output**

```text
HELLO
```

---

# 3. `LOWER()`

Converts text to lowercase.

```sql
SELECT LOWER('HELLO');
```

**Output**

```text
hello
```

---

# 4. `INITCAP()`

Capitalizes the first letter of each word.

```sql
SELECT INITCAP('hello world');
```

**Output**

```text
Hello World
```

---

# 5. `CONCAT()`

Joins multiple strings.

```sql
SELECT CONCAT('John', ' ', 'Doe');
```

**Output**

```text
John Doe
```

---

# 6. `CONCAT_WS()`

Concatenates with a separator.

```sql
SELECT CONCAT_WS('-', '2026', '07', '20');
```

**Output**

```text
2026-07-20
```

---

# 7. `||` (Concatenation Operator)

```sql
SELECT 'Hello' || ' ' || 'World';
```

**Output**

```text
Hello World
```

---

# 8. `SUBSTRING()`

Extracts part of a string.

```sql
SELECT SUBSTRING('PostgreSQL', 1, 4);
```

**Output**

```text
Post
```

---

# 9. `LEFT()`

Returns leftmost characters.

```sql
SELECT LEFT('PostgreSQL', 4);
```

**Output**

```text
Post
```

---

# 10. `RIGHT()`

Returns rightmost characters.

```sql
SELECT RIGHT('PostgreSQL', 3);
```

**Output**

```text
SQL
```

---

# 11. `POSITION()`

Finds the position of a substring.

```sql
SELECT POSITION('SQL' IN 'PostgreSQL');
```

**Output**

```text
9
```

---

# 12. `STRPOS()`

Alternative to `POSITION()`.

```sql
SELECT STRPOS('PostgreSQL', 'SQL');
```

---

# 13. `REPLACE()`

Replaces all occurrences.

```sql
SELECT REPLACE('I like Java', 'Java', 'PostgreSQL');
```

**Output**

```text
I like PostgreSQL
```
POSITI
---

# 14. `TRANSLATE()`

Character-by-character replacement.

```sql
SELECT TRANSLATE('abc123', 'abc', 'xyz');
```

**Output**

```text
xyz123
```

---

# 15. `TRIM()`

Removes spaces (or specified characters).

```sql
SELECT TRIM('   Hello   ');
```

---

# 16. `LTRIM()`

Removes characters from the left.

```sql
SELECT LTRIM('000123', '0');
```

**Output**

```text
123
```

---

# 17. `RTRIM()`

Removes characters from the right.

```sql
SELECT RTRIM('Hello!!!', '!');
```

---

# 18. `LPAD()`

Pads on the left.

```sql
SELECT LPAD('123', 6, '0');
```

**Output**

```text
000123
```

---

# 19. `RPAD()`

Pads on the right.

```sql
SELECT RPAD('ABC', 6, '*');
```

**Output**

```text
ABC***
```

---

# 20. `REPEAT()`

Repeats a string.

```sql
SELECT REPEAT('*', 10);
```

**Output**

```text
**********
```

---

# 21. `REVERSE()`

Reverses a string.

```sql
SELECT REVERSE('Postgres');
```

**Output**

```text
sergtsoP
```

---

# 22. `SPLIT_PART()`

Splits a string and returns the specified part.

```sql
SELECT SPLIT_PART('john@example.com', '@', 2);
```

**Output**

```text
example.com
```

---

# 23. `STRING_TO_ARRAY()`

Converts a string into an array.

```sql
SELECT STRING_TO_ARRAY('A,B,C', ',');
```

**Output**

```text
{A,B,C}
```

---

# 24. `ARRAY_TO_STRING()`

Converts an array into a string.

```sql
SELECT ARRAY_TO_STRING(ARRAY['A','B','C'], ',');
```

**Output**

```text
A,B,C
```

---

# 25. `ASCII()`

Returns the ASCII value of the first character.

```sql
SELECT ASCII('A');
```

**Output**

```text
65
```

---

# 26. `CHR()`

Returns the character for an ASCII code.

```sql
SELECT CHR(65);
```

**Output**

```text
A
```

---

# 27. `MD5()`

Generates an MD5 hash.

```sql
SELECT MD5('password');
```

---

# 28. `REGEXP_REPLACE()`

Replaces text using a regular expression.

```sql
SELECT REGEXP_REPLACE('abc123', '[0-9]', '', 'g');
```

**Output**

```text
abc
```

---

# 29. `REGEXP_MATCH()`

Returns the first regex match.

```sql
SELECT REGEXP_MATCH('abc123', '[0-9]+');
```

---

# 30. `REGEXP_SPLIT_TO_ARRAY()`

Splits a string using a regular expression.

```sql
SELECT REGEXP_SPLIT_TO_ARRAY('A,B;C', '[,;]');
```

**Output**

```text
{A,B,C}
```

---

# Most Important Functions for Interviews

| Function                         | Purpose                       |     |              |
| -------------------------------- | ----------------------------- | --- | ------------ |
| `LENGTH()`                       | Count characters              |     |              |
| `UPPER()`                        | Uppercase                     |     |              |
| `LOWER()`                        | Lowercase                     |     |              |
| `INITCAP()`                      | Capitalize words              |     |              |
| `CONCAT()` / `                   |                               | `   | Join strings |
| `SUBSTRING()`                    | Extract substring             |     |              |
| `LEFT()` / `RIGHT()`             | Extract left/right characters |     |              |
| `POSITION()` / `STRPOS()`        | Find substring position       |     |              |
| `REPLACE()`                      | Replace text                  |     |              |
| `TRIM()` / `LTRIM()` / `RTRIM()` | Remove spaces/characters      |     |              |
| `LPAD()` / `RPAD()`              | Pad strings                   |     |              |
| `SPLIT_PART()`                   | Split by delimiter            |     |              |
| `STRING_TO_ARRAY()`              | Convert string to array       |     |              |
| `ARRAY_TO_STRING()`              | Convert array to string       |     |              |
| `ASCII()` / `CHR()`              | Character/code conversion     |     |              |
| `REGEXP_REPLACE()`               | Regex-based replacement       |     |              |
| `REGEXP_MATCH()`                 | Regex matching                |     |              |
| `MD5()`                          | Hashing                       |     |              |

These functions cover the majority of string manipulation tasks you'll encounter in PostgreSQL development and technical interviews.
