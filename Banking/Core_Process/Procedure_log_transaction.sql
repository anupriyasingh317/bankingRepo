-- 7. Procedure: log_transaction (Autonomous Transaction)

CREATE OR REPLACE PROCEDURE log_transaction(
    p_customer_id NUMBER,
    p_transaction_type VARCHAR2,
    p_transaction_amount NUMBER
) IS
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    INSERT INTO transaction_logs (log_id, customer_id, transaction_type, transaction_amount, log_date)
    VALUES (seq_log_id.NEXTVAL, p_customer_id, p_transaction_type, p_transaction_amount, SYSDATE);
    COMMIT;
END log_transaction;