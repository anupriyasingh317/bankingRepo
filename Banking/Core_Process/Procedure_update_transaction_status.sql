--9. update_transaction_status

CREATE OR REPLACE PROCEDURE update_transaction_status(p_transaction_id NUMBER, p_status VARCHAR2) IS
BEGIN
    UPDATE customer_transactions
    SET status = p_status
    WHERE transaction_id = p_transaction_id;
    COMMIT;
END update_transaction_status;