# Donation & Fundraising Database System  
### CS630 Final Project – Chaimaa Mallas

This project is a relational database system designed for a Donation & Fundraising Platform.  
It includes tables for users, campaigns, beneficiaries, payment methods, donations, and disbursements.

---

## 📌 Project Structure

    sql/
        schema.sql        -- table creation statements
        sample_data.sql   -- sample inserts
        reset.sql         -- drop all tables
    ERD/
        erd-diagram.png   -- entity relationship diagram
    queries/
        example_queries.sql  -- sample SELECT statements
    README.md             -- project overview

---

## 📌 Features Implemented

- Complete ERD design (normalized to 3NF)
- Full schema with all required constraints (PK/FK)
- Sample data for all tables
- Reset script to rebuild the database quickly
- Organized GitHub repository with incremental commits (10+ commits)

---

## 📌 How To Run The Project

1. (Optional) Run:

       sql/reset.sql

2. Create all tables:

       sql/schema.sql

3. Insert sample data:

       sql/sample_data.sql

4. View the data using queries such as:

       SELECT * FROM users;
       SELECT * FROM beneficiary;
       SELECT * FROM campaign;
       SELECT * FROM payment_method;
       SELECT * FROM donation;
       SELECT * FROM disbursement;

---

## 📌 Entity-Relationship Diagram (ERD)

The ERD diagram for this project is included in the `ERD/` folder as:

