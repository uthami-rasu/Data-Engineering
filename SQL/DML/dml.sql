-- ============================================================
-- DML (Data Manipulation Language)
-- ============================================================

/*
DML Commands

1. INSERT
2. UPDATE
3. DELETE

Notes:
- DML commands are used to insert, update, and delete data
  stored in a table.

- DML commands modify the table data, not the table structure.

- Changes made by DML commands are not permanently saved
  until the transaction is COMMITted (unless auto-commit is enabled).

- You can undo uncommitted DML changes using ROLLBACK.
*/


-- ============================================================
-- INSERT
-- ============================================================


-- 1. INSERT INTO ALL COLUMNS
-- (Values must be provided for every column.)

INSERT INTO Organization (
    id,
    amount,
    name,
    created_at,
    updated_at,
    payment_at,
    payment_count,
    status,
    type,
    code,
    parent_id
)
VALUES (
    1,
    30000.00,
    'RT',
    CURRENT_TIMESTAMP,
    NULL,
    NULL,
    5,
    'ACTIVE',
    'PRIVATE',
    'ORG001',
    NULL
);


-- ============================================================
-- 2. INSERT INTO SPECIFIC COLUMNS
-- (Remaining columns use their DEFAULT values or NULL.)
-- ============================================================

INSERT INTO Organization (
    amount,
    name,
    status
)
VALUES (
    30000.00,
    'PT',
    'ACTIVE'
);



-- 1. Update a Single Column 

UPDATE Organization SET name = 'Razz Technologies' WHERE name ='RT'; 

-- 2. Update Multiple Column 
UPDATE Organization SET 
	name = 'Pragg Technologies', 
	payment_count = 10 
WHERE name ='PT'; 


-- 3. Update Multiple Column 
UPDATE Organization SET 
	parent_id = 'Rukz Grps'

-- 4. Update Using Expression Column 
UPDATE Organization SET 
	payment_count = payment_count + 2

-- 5. Update Using Subquery
UPDATE Organization SET 
	payment_count = (SELECT MAX(o.payment_count) FROM Organization o)



SELECT * FROM Organization;

