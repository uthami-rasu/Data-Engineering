
-- Task 1 – Case Conversion

-- 1. Employee name in uppercase.

SELECT UPPER(first_name) from emp;

--2. Employee name in lowercase.

SELECT LOWER(first_name) from emp;

-- 3. Employee name with each word capitalized.

SELECT INITCAP(CONCAT(first_name,' ',last_name)) from emp


-- Task 2 – Concatenation

-- 1. Full name.

SELECT CONCAT(first_name,' ',last_name) from emp

SELECT first_name || ' ' || last_name from emp

-- 2. Full name with employee ID.

SELECT CONCAT(first_name,' ',last_name) as FN, id from emp

-- 3. Email and phone in one column separated by " | ".
SELECT CONCAT_WS('|',email,phone)  from emp

select * from emp;


-- Task 3 – String Length


-- First 3 letters of the first name.

SELECT LEFT(first_name,3) from emp;

-- Last 4 letters of the email.

SELECT RIGHT(email,4) from emp;

-- First 5 characters of the department.

SELECT LEFT(first_name,5) from emp;


-- Task 5 – Find Position

-- Position of '@' in every email.

SELECT email, POSITION('@' IN email) from emp;


SELECT email, STRPOS(email,'@') , POSITION('@' IN email) from emp;

-- Employees whose email contains "gmail".


select * from emp where email ilike '%gmail%'


SELECT SUBSTRING(first_name,1,5) from  emp;

-- Task 6 – Replace Text

-- Replace "gmail.com" with "company.com".

SELECT REPLACE(email,'gmail.com','company.com') from emp;


-- Replace all spaces in department with _.
SELECT REPLACE(department, ' ', '_') from emp;


-- Replace "Chennai" with "Bangalore".


SELECT REPLACE(city, 'Chennai', 'Bangalore') from emp;


-- Task 9 – Split Email


select split_part(email,'@',2) from emp;


select split_part(email,'@',1) from emp;
