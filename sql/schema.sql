-- ============================================
-- SCHEMA FOR DONATION & FUNDRAISING SYSTEM
-- SIMPLE VERSION (NO RECURRING DONATIONS)
-- ============================================

-- USERS TABLE
CREATE TABLE users (
    user_id     NUMBER PRIMARY KEY,
    first_name  VARCHAR2(50) NOT NULL,
    last_name   VARCHAR2(50) NOT NULL,
    email       VARCHAR2(100) NOT NULL,
    role        VARCHAR2(20) NOT NULL
);

-- BENEFICIARY TABLE
CREATE TABLE beneficiary (
    beneficiary_id NUMBER PRIMARY KEY,
    name           VARCHAR2(100) NOT NULL,
    type           VARCHAR2(30)  NOT NULL,
    email          VARCHAR2(100)
);

-- CAMPAIGN TABLE
CREATE TABLE campaign (
    campaign_id    NUMBER PRIMARY KEY,
    organizer_id   NUMBER NOT NULL,
    beneficiary_id NUMBER NOT NULL,
    title          VARCHAR2(150) NOT NULL,
    description    VARCHAR2(1000),
    target_amount  NUMBER(12,2),
    CONSTRAINT fk_campaign_user
        FOREIGN KEY (organizer_id) REFERENCES users(user_id),
    CONSTRAINT fk_campaign_beneficiary
        FOREIGN KEY (beneficiary_id) REFERENCES beneficiary(beneficiary_id)
);

-- PAYMENT_METHOD TABLE
CREATE TABLE payment_method (
    payment_method_id NUMBER PRIMARY KEY,
    user_id           NUMBER NOT NULL,
    method_type       VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_payment_user
        FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- DONATION TABLE
CREATE TABLE donation (
    donation_id       NUMBER PRIMARY KEY,
    campaign_id       NUMBER NOT NULL,
    donor_id          NUMBER NOT NULL,
    payment_method_id NUMBER NOT NULL,
    amount            NUMBER(12,2) NOT NULL,
    donation_date     DATE NOT NULL,
    CONSTRAINT fk_donation_campaign
        FOREIGN KEY (campaign_id) REFERENCES campaign(campaign_id),
    CONSTRAINT fk_donation_donor
        FOREIGN KEY (donor_id) REFERENCES users(user_id),
    CONSTRAINT fk_donation_payment
        FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id)
);

-- DISBURSEMENT TABLE
CREATE TABLE disbursement (
    disbursement_id   NUMBER PRIMARY KEY,
    campaign_id       NUMBER NOT NULL,
    beneficiary_id    NUMBER NOT NULL,
    amount            NUMBER(12,2) NOT NULL,
    disbursement_date DATE NOT NULL,
    CONSTRAINT fk_disb_campaign
        FOREIGN KEY (campaign_id) REFERENCES campaign(campaign_id),
    CONSTRAINT fk_disb_beneficiary
        FOREIGN KEY (beneficiary_id) REFERENCES beneficiary(beneficiary_id)
);

