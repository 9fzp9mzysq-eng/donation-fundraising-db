-- ============================================
-- SAMPLE DATA FOR DONATION & FUNDRAISING SYSTEM
-- SIMPLE VERSION (NO RECURRING DONATIONS)
-- ============================================

-----------------------
-- USERS
-----------------------
INSERT INTO users (user_id, first_name, last_name, email, role)
VALUES (1, 'Chaimaa', 'Mallas', 'chaimaa@example.com', 'ORGANIZER');

INSERT INTO users (user_id, first_name, last_name, email, role)
VALUES (2, 'Adam', 'Smith', 'adam@example.com', 'DONOR');

INSERT INTO users (user_id, first_name, last_name, email, role)
VALUES (3, 'Sara', 'Johnson', 'sara@example.com', 'DONOR');


-----------------------
-- BENEFICIARY
-----------------------
INSERT INTO beneficiary (beneficiary_id, name, type, email)
VALUES (1, 'Hope Children Foundation', 'NONPROFIT', 'contact@hope.org');

INSERT INTO beneficiary (beneficiary_id, name, type, email)
VALUES (2, 'Ahmed El Fassi', 'INDIVIDUAL', 'ahmed@example.com');


-----------------------
-- CAMPAIGN
-----------------------
INSERT INTO campaign (campaign_id, organizer_id, beneficiary_id, title, description, target_amount)
VALUES (1, 1, 1, 'Support Orphan Education', 'Raising funds for school materials.', 5000);

INSERT INTO campaign (campaign_id, organizer_id, beneficiary_id, title, description, target_amount)
VALUES (2, 1, 2, 'Rebuild Ahmed''s Home', 'Helping Ahmed rebuild after a home fire.', 15000);


-----------------------
-- PAYMENT_METHOD
-----------------------
INSERT INTO payment_method (payment_method_id, user_id, method_type)
VALUES (1, 2, 'CARD');

INSERT INTO payment_method (payment_method_id, user_id, method_type)
VALUES (2, 3, 'CARD');


-----------------------
-- DONATION
-----------------------
INSERT INTO donation (donation_id, campaign_id, donor_id, payment_method_id, amount, donation_date)
VALUES (1, 1, 2, 1, 100, TO_DATE('2024-12-01', 'YYYY-MM-DD'));

INSERT INTO donation (donation_id, campaign_id, donor_id, payment_method_id, amount, donation_date)
VALUES (2, 2, 3, 2, 150, TO_DATE('2024-12-02', 'YYYY-MM-DD'));


-----------------------
-- DISBURSEMENT
-----------------------
INSERT INTO disbursement (disbursement_id, campaign_id, beneficiary_id, amount, disbursement_date)
VALUES (1, 1, 1, 500, TO_DATE('2024-12-03', 'YYYY-MM-DD'));

INSERT INTO disbursement (disbursement_id, campaign_id, beneficiary_id, amount, disbursement_date)
VALUES (2, 2, 2, 800, TO_DATE('2024-12-04', 'YYYY-MM-DD'));

COMMIT;

