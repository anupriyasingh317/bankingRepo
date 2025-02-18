-- 20. Main Procedure: process_transactions
CREATE OR REPLACE PROCEDURE process_transactions IS
    CURSOR pending_transactions IS
        SELECT transaction_id, customer_id, transaction_amount, transaction_type
        FROM customer_transactions
        WHERE status = 'PENDING';
    v_transaction_id customer_transactions.transaction_id%TYPE;
    v_customer_id customer_transactions.customer_id%TYPE;
    v_transaction_amount customer_transactions.transaction_amount%TYPE;
    v_transaction_type customer_transactions.transaction_type%TYPE;
    v_log_message VARCHAR2(100);
BEGIN
    FOR rec IN pending_transactions LOOP
        v_transaction_id := rec.transaction_id;
        v_customer_id := rec.customer_id;
        v_transaction_amount := rec.transaction_amount;
        v_transaction_type := rec.transaction_type;
       
        -- Decision making using CASE and IF-ELSE
        CASE
            WHEN v_transaction_type = 'DEPOSIT' THEN
                process_deposit(v_customer_id, v_transaction_amount);
            WHEN v_transaction_type = 'WITHDRAWAL' THEN
                IF check_balance(v_customer_id, v_transaction_amount) THEN
                    process_withdrawal(v_customer_id, v_transaction_amount);
                ELSE
                    insufficient_balance(v_transaction_id);
                END IF;
            ELSE
                RAISE_APPLICATION_ERROR(-20002, 'Invalid transaction type for transaction ' || v_transaction_id);
        END CASE;
       
        update_transaction_status(v_transaction_id, 'PROCESSED');
        log_transaction(v_customer_id, v_transaction_type, v_transaction_amount);
        v_log_message := 'Processed transaction ' || v_transaction_id || ' for customer ' || v_customer_id;
        DBMS_OUTPUT.PUT_LINE(v_log_message);
        COMMIT;
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        rollback_transaction;
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END process_transactions;