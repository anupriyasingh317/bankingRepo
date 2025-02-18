-- 3. Create Table for accounts

CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    customer_id NUMBER UNIQUE,
    balance NUMBER(10,2) DEFAULT 0
);