-- 5. Function: calculate_balance

CREATE OR REPLACE FUNCTION calculate_balance(p_account_id NUMBER, p_transaction_amount NUMBER) RETURN NUMBER IS
    v_current_balance NUMBER(10, 2);
BEGIN
    SELECT balance INTO v_current_balance FROM accounts WHERE account_id = p_account_id;
    RETURN v_current_balance + p_transaction_amount;
END calculate_balance;