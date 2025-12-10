-- ============================================
-- EXAMPLE SQL QUERIES FOR DONATION PLATFORM
-- ============================================

-- 🔹 View all tables
SELECT * FROM users;
SELECT * FROM beneficiary;
SELECT * FROM campaign;
SELECT * FROM payment_method;
SELECT * FROM donation;
SELECT * FROM disbursement;

-- 🔹 Select with conditions
SELECT * FROM donation WHERE campaign_id = 1;
SELECT * FROM campaign WHERE target_amount > 10000;

-- 🔹 Insert examples
INSERT INTO users (user_id, first_name, last_name, email, role)
VALUES (4, 'John', 'Doe', 'john@example.com', 'DONOR');

INSERT INTO donation (donation_id, campaign_id, donor_id, payment_method_id, amount, donation_date)
VALUES (3, 1, 3, 2, 200, SYSDATE);

-- 🔹 Update example
UPDATE campaign
SET target_amount = 20000
WHERE campaign_id = 2;

-- 🔹 Delete examples
DELETE FROM donation WHERE donation_id = 1;
DELETE FROM donation WHERE campaign_id = 1;

-- 🔹 Truncate examples
TRUNCATE TABLE donation;

-- Correct truncate order for whole DB
TRUNCATE TABLE disbursement;
TRUNCATE TABLE donation;
TRUNCATE TABLE payment_method;
TRUNCATE TABLE campaign;
TRUNCATE TABLE beneficiary;
TRUNCATE TABLE users;

-- 🔹 Drop table (example)
DROP TABLE donation CASCADE CONSTRAINTS;

-- 🔹 Reset using reset.sql
-- @sql/reset.sql

-- ============================================
-- END OF FILE
-- ============================================
