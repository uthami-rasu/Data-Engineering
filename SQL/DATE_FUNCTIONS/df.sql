-- 1. Display today's date.


SELECT CURRENT_DATE;

SELECT DATE_PART('day',NOW());


-- 2. Display the current timestamp.

SELECT CURRENT_TIMESTAMP;


-- 3. Display the current time.

SELECT CURRENT_TIME;

SELECT DATE_PART('year',NOW());

-- 4. Display the current date and time in UTC.

SELECT NOW() AT TIME ZONE 'UTC';

-- Task 2: Extract Parts of Date

-- 1. Extract the year.

SELECT EXTRACT(YEAR FROM NOW());

SELECT DATE_PART('year',NOW());

-- 2. Extract the month.

SELECT EXTRACT(MONTH FROM NOW());

SELECT DATE_PART('month',NOW());

-- 3. Extract the day.

SELECT EXTRACT(DAY FROM NOW());

SELECT DATE_PART('DAY',NOW());

-- 4. Extract the Day of week number.

SELECT EXTRACT(DOW FROM NOW());

SELECT DATE_PART('dow',NOW());

-- 5. Extract the quarter. 

SELECT EXTRACT(QUARTER FROM NOW());

SELECT DATE_PART('QUARTER',NOW());

-- 6. Extract the hour.

SELECT EXTRACT(HOUR FROM NOW());

SELECT DATE_PART('HOUR',NOW());

-- 7. Extract the minute.

SELECT EXTRACT(MINUTE FROM NOW());

SELECT DATE_PART('MINUTE',NOW());

-- 8. Extract the week number.

SELECT EXTRACT(WEEK FROM NOW());

SELECT DATE_PART('WEEK',NOW());

-- 9. Extract the day of the year.

SELECT EXTRACT(DOY FROM NOW());

SELECT DATE_PART('DOY',NOW());


-- Task 3: Formatting Dates

SELECT TO_CHAR(NOW(), 'DD-Mon-YYYY'); -- 20-Jul-2026

SELECT TO_CHAR(NOW(), 'Day');   -- Monday

SELECT TO_CHAR(NOW(), 'Month');   -- July

SELECT TO_CHAR(NOW(), 'YYYY-MM');   -- 2026-07

SELECT TO_CHAR(NOW(), 'DD/MM/YYYY');   -- 20/07/2026


-- # Task 4: Date Arithmetic

-- 1. Add 30 days.

SELECT NOW() + INTERVAL '30 Days'

-- 2. Add 6 months.

SELECT NOW() + INTERVAL '6 months'

-- 3. Add 1 year.

SELECT NOW() + INTERVAL '1 Year'

-- 4. Subtract 15 days.

SELECT NOW() - INTERVAL '15 Days'

-- 5. Find the date after 100 days.

SELECT EXTRACT(Day FROM NOW() + INTERVAL '100 Days')


-- # Task 5: Difference Between Dates


SELECT AGE(NOW()::DATE, TO_DATE('20-06-2025','DD-MM-YYYY'));


SELECT (EXTRACT(YEAR FROM AGE(NOW()::DATE, TO_DATE('20-06-2025','DD-MM-YYYY'))) *12) + EXTRACT(MONTH FROM AGE(NOW()::DATE, TO_DATE('20-06-2025','DD-MM-YYYY')));


-- # Task 6: DATE_TRUNC()


-- 1. Beginning of hour
SELECT DATE_TRUNC('hour',NOW());

-- 2. Beginning of day
SELECT DATE_TRUNC('day',NOW());

-- 3. Beginning of week
SELECT DATE_TRUNC('week',NOW());

--4. Beginning of month
SELECT DATE_TRUNC('month',NOW());

--5. Beginning of quarter
SELECT DATE_TRUNC('quarter',NOW());

-- 6. Beginning of year
SELECT DATE_TRUNC('year',NOW());

