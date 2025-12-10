
Error starting at line : 1 in command -
CREATE TABLE users (
    user_id     NUMBER PRIMARY KEY,
    first_name  VARCHAR2(50) NOT NULL,
    last_name   VARCHAR2(50) NOT NULL,
    email       VARCHAR2(100) NOT NULL,
    role        VARCHAR2(20) NOT NULL
)
Error report -
ORA-00955: name is already used by an existing object

https://docs.oracle.com/error-help/db/ora-00955/00955. 00000 -  "name is already used by an existing object"
*Cause:    An attempt was made to create a database object (such
           as a table, view, cluster, index, or synonym) that already
           existed. A user's database objects must have distinct names.
*Action:   Enter a unique name for the database object or modify
           or drop the existing object so it can be reused.

Error starting at line : 8 in command -
CREATE TABLE beneficiary (
    beneficiary_id NUMBER PRIMARY KEY,
    name           VARCHAR2(100) NOT NULL,
    type           VARCHAR2(30)  NOT NULL,   -- INDIVIDUAL or NONPROFIT
    email          VARCHAR2(100)
)
Error report -
ORA-00955: name is already used by an existing object

https://docs.oracle.com/error-help/db/ora-00955/00955. 00000 -  "name is already used by an existing object"
*Cause:    An attempt was made to create a database object (such
           as a table, view, cluster, index, or synonym) that already
           existed. A user's database objects must have distinct names.
*Action:   Enter a unique name for the database object or modify
           or drop the existing object so it can be reused.

Error starting at line : 14 in command -
CREATE TABLE campaign (
    campaign_id    NUMBER        PRIMARY KEY,
    organizer_id   NUMBER        NOT NULL,
    beneficiary_id NUMBER        NOT NULL,
    title          VARCHAR2(150) NOT NULL,
    description    VARCHAR2(1000),
    target_amount  NUMBER(1_
CREATE TABLE campaign (
    campaign_id    NUMBER        PRIMARY KEY,
    organizer_id   NUMBER        NOT NULL,
    beneficiary_id NUMBER        NOT NULL,
    title          VARCHAR2(150) NOT NULL,
    description    VARCHAR2(1000),
    target_amount  NUMBER(12,2),

    CONSTRAINT fk_campaign_user
        FOREIGN KEY (organizer_id)
        REFERENCES users(user_id),

    CONSTRAINT fk_campaign_beneficiary
        FOREIGN KEY (beneficiary_id)
        REFERENCES beneficiary(beneficiary_id)
)
Error report -
ORA-00911: invalid character

https://docs.oracle.com/error-help/db/ora-00911/00911. 00000 -  "%s: invalid character after %s"
*Cause:    An invalid character has been encountered in the SQL statement.
*Action:   Remove the invalid character. If it is part of an identifier,
           enclose the identifier in double quotation marks.
*Params:   1) character_value
           2) token_value: The token after which the invalid character causing
           the error occurs.

Error starting at line : 37 in command -
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
)
Error report -
ORA-00955: name is already used by an existing object

https://docs.oracle.com/error-help/db/ora-00955/00955. 00000 -  "name is already used by an existing object"
*Cause:    An attempt was made to create a database object (such
           as a table, view, cluster, index, or synonym) that already
           existed. A user's database objects must have distinct names.
*Action:   Enter a unique name for the database object or modify
           or drop the existing object so it can be reused.

Error starting at line : 49 in command -
CREATE TABLE payment_method (
    payment_method_id NUMBER PRIMARY KEY,
    user_id           NUMBER NOT NULL,
    method_type       VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_payment_user
        FOREIGN KEY (user_id) REFERENCES users(user_id)
)
Error report -
ORA-00955: name is already used by an existing object

https://docs.oracle.com/error-help/db/ora-00955/00955. 00000 -  "name is already used by an existing object"
*Cause:    An attempt was made to create a database object (such
           as a table, view, cluster, index, or synonym) that already
           existed. A user's database objects must have distinct names.
*Action:   Enter a unique name for the database object or modify
           or drop the existing object so it can be reused.

Table DONATION created.


Error starting at line : 73 in command -
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
)
Error report -
ORA-00955: name is already used by an existing object

https://docs.oracle.com/error-help/db/ora-00955/00955. 00000 -  "name is already used by an existing object"
*Cause:    An attempt was made to create a database object (such
           as a table, view, cluster, index, or synonym) that already
           existed. A user's database objects must have distinct names.
*Action:   Enter a unique name for the database object or modify
           or drop the existing object so it can be reused.

1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


   USER_ID FIRST_NAME                                         LAST_NAME                                          EMAIL                                                                                                ROLE                
---------- -------------------------------------------------- -------------------------------------------------- ---------------------------------------------------------------------------------------------------- --------------------
         1 Chaimaa                                            Mallas                                             chaimaa@example.com                                                                                  ORGANIZER           
         2 Adam                                               Smith                                              adam@example.com                                                                                     DONOR               
         3 Sara                                               Johnson                                            sara@example.com                                                                                     DONOR               


BENEFICIARY_ID NAME                                                                                                 TYPE                           EMAIL                                                                                               
-------------- ---------------------------------------------------------------------------------------------------- ------------------------------ ----------------------------------------------------------------------------------------------------
             1 Hope Children Foundation                                                                             NONPROFIT                      contact@hope.org                                                                                    
             2 Ahmed El Fassi                                                                                       INDIVIDUAL                     ahmed@example.com                                                                                   


CAMPAIGN_ID ORGANIZER_ID BENEFICIARY_ID TITLE
----------- ------------ -------------- ------------------------------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              TARGET_AMOUNT
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------
          1            1              1 Support Orphan Education                                                                                                                               
Raising funds for school materials.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               5000

          2            1              2 Rebuild Ahmed's Home                                                                                                                                   
Helping Ahmed rebuild after a home fire.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         15000



PAYMENT_METHOD_ID    USER_ID METHOD_TYPE                   
----------------- ---------- ------------------------------
                1          2 CARD                          
                2          3 CARD                          


DONATION_ID CAMPAIGN_ID   DONOR_ID PAYMENT_METHOD_ID     AMOUNT DONATION_
----------- ----------- ---------- ----------------- ---------- ---------
          1           1          2                 1        100 01-DEC-24
          2           2          3                 2        150 02-DEC-24


DISBURSEMENT_ID CAMPAIGN_ID BENEFICIARY_ID     AMOUNT DISBURSEM
--------------- ----------- -------------- ---------- ---------
              1           1              1        500 03-DEC-24
              2           2              2        800 04-DEC-24


   USER_ID FIRST_NAME                                         LAST_NAME                                          EMAIL                                                                                                ROLE                
---------- -------------------------------------------------- -------------------------------------------------- ---------------------------------------------------------------------------------------------------- --------------------
         1 Chaimaa                                            Mallas                                             chaimaa@example.com                                                                                  ORGANIZER           
         2 Adam                                               Smith                                              adam@example.com                                                                                     DONOR               
         3 Sara                                               Johnson                                            sara@example.com                                                                                     DONOR               


BENEFICIARY_ID NAME                                                                                                 TYPE                           EMAIL                                                                                               
-------------- ---------------------------------------------------------------------------------------------------- ------------------------------ ----------------------------------------------------------------------------------------------------
             1 Hope Children Foundation                                                                             NONPROFIT                      contact@hope.org                                                                                    
             2 Ahmed El Fassi                                                                                       INDIVIDUAL                     ahmed@example.com                                                                                   


CAMPAIGN_ID ORGANIZER_ID BENEFICIARY_ID TITLE
----------- ------------ -------------- ------------------------------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              TARGET_AMOUNT
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------
          1            1              1 Support Orphan Education                                                                                                                               
Raising funds for school materials.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               5000

          2            1              2 Rebuild Ahmed's Home                                                                                                                                   
Helping Ahmed rebuild after a home fire.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         15000



PAYMENT_METHOD_ID    USER_ID METHOD_TYPE                   
----------------- ---------- ------------------------------
                1          2 CARD                          
                2          3 CARD                          


DONATION_ID CAMPAIGN_ID   DONOR_ID PAYMENT_METHOD_ID     AMOUNT DONATION_
----------- ----------- ---------- ----------------- ---------- ---------
          1           1          2                 1        100 01-DEC-24
          2           2          3                 2        150 02-DEC-24


DISBURSEMENT_ID CAMPAIGN_ID BENEFICIARY_ID     AMOUNT DISBURSEM
--------------- ----------- -------------- ---------- ---------
              1           1              1        500 03-DEC-24
              2           2              2        800 04-DEC-24


DONATION_ID CAMPAIGN_ID   DONOR_ID PAYMENT_METHOD_ID     AMOUNT DONATION_
----------- ----------- ---------- ----------------- ---------- ---------
          1           1          2                 1        100 01-DEC-24


CAMPAIGN_ID ORGANIZER_ID BENEFICIARY_ID TITLE
----------- ------------ -------------- ------------------------------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              TARGET_AMOUNT
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------
          2            1              2 Rebuild Ahmed's Home                                                                                                                                   
Helping Ahmed rebuild after a home fire.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         15000



1 row inserted.


1 row inserted.


1 row updated.


1 row deleted.


1 row deleted.


Table DONATION truncated.


Table DISBURSEMENT truncated.


Table DONATION truncated.


Table PAYMENT_METHOD truncated.


Table CAMPAIGN truncated.


Table BENEFICIARY truncated.


Table USERS truncated.


Table DONATION dropped.

