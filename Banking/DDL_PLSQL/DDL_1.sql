--1. Create Table for Customer Transactions

CREATE TABLE customer_transactions (
    transaction_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    transaction_amount NUMBER(10, 2),
    transaction_type VARCHAR2(20),
    transaction_date DATE DEFAULT SYSDATE,
    status VARCHAR2(10)
);