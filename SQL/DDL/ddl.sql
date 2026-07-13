-- ============================================================
-- DDL (Data Definition Language)
-- ============================================================

/*
DDL Commands

1. CREATE
2. ALTER
3. TRUNCATE
4. DROP
5. RENAME

Notes:
- DDL commands are used to create and modify database objects
  such as tables and views.
- You can ALTER a table only if you are the owner of the table
  or have the required privileges.
*/


-- ============================================================
-- CREATE TABLE
-- ============================================================

-- Create table with inline constraints




-- ============================================================
-- CREATE TABLE WITH NAMED CONSTRAINTS
-- ============================================================

/*

Syntax

CREATE TABLE table_name (

    column_name data_type,

    CONSTRAINT constraint_name
    constraint_type (column_name)

);

*/


-- Example 1 : Primary Key

CREATE TABLE employees (

    id INT,
    first_name VARCHAR(100),

    CONSTRAINT pk_employees
    PRIMARY KEY (id)

);


-- Example 2 : Primary Key + Foreign Key

CREATE TABLE orders (

    order_id INT,
    customer_id INT,

    CONSTRAINT pk_orders
    PRIMARY KEY (order_id),

    CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)

);


-- ============================================================
-- ALTER TABLE
-- ============================================================


-- 1. Add a New Column

ALTER TABLE Organization
ADD COLUMN networth NUMERIC(18,2);


-- 2. Drop a Column

ALTER TABLE Organization
DROP COLUMN networth;


-- 3. Modify a Column

ALTER TABLE Organization
ALTER COLUMN networth
TYPE DECIMAL(20,2);


-- 4. Rename a Column

ALTER TABLE Organization
RENAME COLUMN networth TO networth1;


-- 5. Add a New Constraint

ALTER TABLE Organization
ADD CONSTRAINT nameuniq
UNIQUE (name);


-- 6. Modify a Constraint

/*
There is no single command to modify a constraint.

Steps:
1. Drop the existing constraint.
2. Create the constraint again with the required changes.
*/


-- 7. Drop a Constraint

ALTER TABLE Organization
DROP CONSTRAINT nameuniq;


-- ============================================================
-- TRUNCATE
-- ============================================================

/*
TRUNCATE removes all rows from a table.
The table structure remains unchanged.
*/

TRUNCATE TABLE Organization;


-- ============================================================
-- RENAME
-- ============================================================

/*
RENAME is used to rename database objects
such as tables and views.
*/

ALTER TABLE Organization
RENAME TO companies;


-- ============================================================
-- DROP
-- ============================================================

/*
DROP permanently removes the table
along with its structure and data.
*/

DROP TABLE companies;