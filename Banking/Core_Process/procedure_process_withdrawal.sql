--13. Procedure: process_withdrawal

CREATE OR REPLACE PROCEDURE process_withdrawal(p_customer_id NUMBER, p_amount NUMBER) IS
BEGIN
    UPDATE accounts
    SET balance = balance - p_amount
    WHERE customer_id = p_customer_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Withdrawal successful for customer ' || p_customer_id);
END process_withdrawal;