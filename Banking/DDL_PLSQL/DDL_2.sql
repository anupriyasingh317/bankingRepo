-- 2. Create Table for Transaction Logs

CREATE TABLE transaction_logs (
    log_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    transaction_type VARCHAR2(20),
    transaction_amount NUMBER(10, 2),
    log_date DATE DEFAULT SYSDATE
);