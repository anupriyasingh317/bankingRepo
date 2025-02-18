--11. Function: check_balance

CREATE OR REPLACE FUNCTION check_balance(p_customer_id NUMBER, p_amount NUMBER) RETURN BOOLEAN IS
    v_balance NUMBER(10, 2);
BEGIN
    SELECT balance INTO v_balance FROM accounts WHERE customer_id = p_customer_id;
    RETURN (v_balance >= p_amount);
END check_balance;