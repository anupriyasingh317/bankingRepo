--14. Procedure: insufficient_balance (Custom Exception Handler)

CREATE OR REPLACE PROCEDURE insufficient_balance(p_transaction_id NUMBER) IS
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance for transaction ' || p_transaction_id);
END insufficient_balance;