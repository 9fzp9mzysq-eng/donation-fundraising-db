# Donation & Fundraising Database System  
### CS630 Final Project – Chaimaa Mallas

This project is a relational database system designed for a Donation & Fundraising Platform.  
It includes tables for users, campaigns, beneficiaries, payment methods, donations, and disbursements.

--------------------------------------------------
## Project Structure

    sql/
        schema.sql        -- table creation statements
        sample_data.sql   -- sample inserts
        reset.sql         -- drop all tables
    ERD/
        erd-diagram.png   -- entity relationship diagram
    queries/
        example_queries.sql  -- sample queries
    README.md             -- project overview

--------------------------------------------------
## Features Implemented

- Complete ERD design (normalized to 3NF)
- Full schema with all required constraints (PK/FK)
- Sample data for all tables
- Reset script to rebuild the database quickly
- Organized GitHub repository with incremental commits (10+ commits)

--------------------------------------------------
## How To Run The Project

1. (Optional) Reset the database:
       sql/reset.sql

2. Create all tables:
       sql/schema.sql

3. Insert sample data:
       sql/sample_data.sql

4. View tables using queries such as:
       SELECT * FROM users;
       SELECT * FROM beneficiary;
       SELECT * FROM campaign;
       SELECT * FROM payment_method;
       SELECT * FROM donation;
       SELECT * FROM disbursement;

--------------------------------------------------
## Example SQL Queries

--- Select Queries ---
Retrieve all users:
SELECT * FROM users;

Retrieve all campaigns:
SELECT * FROM campaign;

Retrieve all donations for Campaign 1:
SELECT * FROM donation WHERE campaign_id = 1;


--- Insert Queries ---
Add a new user:
INSERT INTO users (user_id, first_name, last_name, email, role)
VALUES (4, 'John', 'Doe', 'john@example.com', 'DONOR');

Add a new donation:
INSERT INTO donation (donation_id, campaign_id, donor_id, payment_method_id, amount, donation_date)
VALUES (3, 1, 3, 2, 200, SYSDATE);


--- Update Queries ---
Update campaign amount:
UPDATE campaign
SET target_amount = 20000
WHERE campaign_id = 2;


--- Delete Queries ---
Delete a donation:
DELETE FROM donation WHERE donation_id = 1;

Delete all donations for Campaign 1:
DELETE FROM donation WHERE campaign_id = 1;


--- Truncate Queries (remove all rows instantly) ---
TRUNCATE TABLE donation;

Truncate all tables in correct FK order:
TRUNCATE TABLE disbursement;
TRUNCATE TABLE donation;
TRUNCATE TABLE payment_method;
TRUNCATE TABLE campaign;
TRUNCATE TABLE beneficiary;
TRUNCATE TABLE users;


--- Drop Table ---
DROP TABLE donation CASCADE CONSTRAINTS;


--- Reset Entire Database ---
@sql/reset.sql

--------------------------------------------------
## Entity-Relationship Diagram (ERD)

The ERD is located in the ERD/ folder as:

    erd-diagram.png

It shows all entities, attributes, and relationships for the system.

--------------------------------------------------
## Author

Chaimaa Mallas  
Master’s in Business Analytics  
CS630 – Final Project  
Monroe College
