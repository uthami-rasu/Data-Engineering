INSERT INTO public.organization
(amount, name, payment_at, payment_count, status, type, code, parent_id)
VALUES
(1000.00, 'Alpha Technologies', '2026-01-10', 5, 'ACTIVE', 'PRIVATE', 'ORG001', 'P100'),
(2500.50, 'Beta Solutions', '2026-02-12', 8, 'ACTIVE', 'PRIVATE', 'ORG002', 'P101'),
(1500.75, 'Gamma Industries', '2026-03-15', 3, 'INACTIVE', 'PUBLIC', 'ORG003', 'P102'),
(800.00, 'Delta Corp', NULL, 0, 'PENDING', 'PRIVATE', 'ORG004', 'P103'),
(5000.00, 'Echo Systems', '2026-04-18', 15, 'ACTIVE', 'PUBLIC', 'ORG005', 'P104'),
(3200.00, 'Foxtrot Ltd', '2026-05-01', 10, 'ACTIVE', 'PRIVATE', 'ABC101', 'PX01'),
(2200.00, 'Global Tech', '2026-05-08', 6, 'SUSPENDED', 'PUBLIC', 'ABC102', 'PX02'),
(1750.00, 'Helix Soft', NULL, 1, 'ACTIVE', 'PRIVATE', 'XYZ001', 'PX03'),
(990.00, 'InnovateX', '2026-06-11', 2, 'PENDING', 'PRIVATE', 'XYZ002', 'PX04'),
(2750.00, 'Jupiter Labs', '2026-06-18', 7, 'ACTIVE', 'PUBLIC', 'XYZ003', 'PX05'),

(1200.00, 'Kilo Networks', '2026-07-01', 4, 'ACTIVE', 'PRIVATE', 'COMP100', 'HQ01'),
(3100.00, 'Lambda Info', '2026-07-09', 9, 'INACTIVE', 'PUBLIC', 'COMP101', 'HQ02'),
(4500.00, 'Micro Dynamics', NULL, 0, 'ACTIVE', 'PRIVATE', 'COMP102', 'HQ03'),
(1800.00, 'Nova Digital', '2026-07-20', 2, 'PENDING', 'PRIVATE', 'DEV001', 'HQ04'),
(2400.00, 'Omega Tech', '2026-08-01', 6, 'ACTIVE', 'PUBLIC', 'DEV002', 'HQ05'),
(2800.00, 'Prime Analytics', '2026-08-12', 8, 'ACTIVE', 'PRIVATE', 'DEV003', 'HQ06'),
(3600.00, 'Quantum AI', '2026-08-25', 12, 'SUSPENDED', 'PUBLIC', 'DATA01', 'ROOT1'),
(4100.00, 'Rocket Software', NULL, 5, 'ACTIVE', 'PRIVATE', 'DATA02', 'ROOT2'),
(6000.00, 'Sigma Cloud', '2026-09-10', 20, 'ACTIVE', 'PUBLIC', 'DATA03', 'ROOT3'),
(1350.00, 'Zenith Labs', '2026-09-15', 3, 'INACTIVE', 'PRIVATE', 'TEST99', 'ROOT4');





-- 1. Find organizations whose name starts with A

SELECT * FROM organization 
WHERE name ~ '^A';

SELECT * FROM organization WHERE name LIKE 'A%';

SELECT * FROM organization 
WHERE name ~* '^A';

SELECT * FROM organization WHERE name ILIKE 'A%';




-- 2. Find organizations whose name ends with Tech

SELECT * FROM organization WHERE name ILIKE '%Tech';

SELECT * FROM organization WHERE name ~* 'Tech$'

-- 3. Find organizations containing the word Lab


SELECT * FROM organization WHERE name ILIKE '%Lab%';

SELECT * FROM organization WHERE name ~* 'Lab'

-- 4.Find organizations starting with A or B


SELECT * FROM organization WHERE name ILIKE 'A%' or name ILIKE 'B%'

SELECT * FROM organization WHERE name ~* '^[AB]';

-- 5. Find organizations not starting with A

SELECT * FROM organization WHERE name not ILIKE 'A%'; 
SELECT * FROM organization WHERE name !~* '^A';

-- 6. Find codes beginning with ORG
SELECT code , name FROM organization WHERE code ILIKE 'ORG%';

SELECT code, name FROM organization WHERE code ~* '^ORG.*';


-- 7. Find codes ending with 01
SELECT code , name FROM organization WHERE code ILIKE '%01';

SELECT code, name FROM organization WHERE code ~* '01$';


-- 8. Find codes containing only letters followed by numbers

SELECT code, name FROM organization WHERE code ~* '^[A-Z]+[0-9]+$';

-- 9. Find parent IDs starting with P
SELECT name,parent_id FROM organization WHERE parent_id ~* '^P';

-- 10. Find parent IDs starting with PX
SELECT name,parent_id FROM organization WHERE parent_id ~* '^PX';


-- 11. Find parent IDs ending with a digit between 1 and 3
SELECT name,parent_id FROM organization WHERE parent_id ~* '[1-3]$';

-- 12. Find organization names beginning with any letter from A to F

SELECT * FROM organization WHERE name ~* '^[A-F]';

-- 13. Find organization names that do not start with letters A–M

SELECT * FROM organization WHERE name ~* '^[^A-M]';

-- 14. Find codes that have exactly three letters followed by three digits

SELECT code, name FROM organization WHERE code ~* '^[A-Z]{3}[0-9]{3}$';


-- 15. Starts with exactly 3 letters and ends with 2 digits

SELECT code, name FROM organization WHERE code ~* '^[A-Z]{3}[0-9]{2}$';

-- 16. Starts with 3 or 4 letters followed by numbers

SELECT code, name FROM organization WHERE code ~* '^[A-Z]{3,4}[0-9]+$';




-- Write a regex to validate a 4-digit PIN.


SELECT '1234' ~ '^[0-9]{4}$' AS is_valid_pin;  -- Returns true

-- Write a regex to validate only alphabets.

SELECT 'ABCD' ~  '^[A-Za-z]+$' AS only_alpha;


-- Write a regex to validate only lowercase letters.

SELECT 'ABCD' ~  '^[a-z]+$' AS is_lowercase_letters;

SELECT 'abcs' ~  '^[a-z]+$' AS is_lowercase_letters;


/* 
Write a regex to validate a username.

Rules:

Starts with a letter
Can contain letters, digits, underscore
Length between 5 and 15

*/


Select 'Razzs' ~ '^[A-Za-z][A-Za-z0-9_]{4,14}$' AS is_valid_username;


/*
Write a regex to validate an Indian Mobile Number.

Rules:

Exactly 10 digits
Starts with 6, 7, 8, or 9

*/ 


SELECT '8248490396' ~  '^[6-9][0-9]{9}$';


/* 
Q8

Write a regex to validate a Password.

Rules:

Minimum 8 characters
At least one uppercase
At least one lowercase
At least one digit

V*/ 

select 'raZz@postgres28' ~ '^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}' as is_valid_pass;

-- Write a regex to validate a Date in the format: DD/MM/YYYY

SELECT
'13/07/2026' ~
'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/[0-9]{4}$'
AS is_valid_date;

select '28/12/2003' ~ '^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/[0-9]{4}$' AS is_valid_date;
