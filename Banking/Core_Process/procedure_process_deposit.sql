--12. Procedure: process_deposit

CREATE OR REPLACE PROCEDURE process_deposit(p_customer_id NUMBER, p_amount NUMBER) IS
BEGIN
    UPDATE accounts
    SET balance = balance + p_amount
    WHERE customer_id = p_customer_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Deposit successful for customer ' || p_customer_id);
END process_deposit;