--18. Bulk Processing Example: (Anonymous Block using BULK COLLECT)
DECLARE
    TYPE trans_table_type IS TABLE OF customer_transactions%ROWTYPE;
    v_transactions trans_table_type;
BEGIN
    SELECT * BULK COLLECT INTO v_transactions
    FROM customer_transactions ct
    WHERE ct.status = 'PENDING';
    FOR i IN 1..v_transactions.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Bulk Processing Transaction ' || v_transactions(i).transaction_id);
        -- Example processing call; you could call process_transactions logic here
    END LOOP;
    COMMIT;
END;