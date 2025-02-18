-- 19. Bulk DML Update with FORALL (Anonymous Block)
DECLARE
    TYPE status_table_type IS TABLE OF customer_transactions.transaction_id%TYPE;
    v_transaction_ids status_table_type := status_table_type(101, 102, 103);  -- Example IDs
BEGIN
    FORALL i IN 1..v_transaction_ids.COUNT
        UPDATE customer_transactions
        SET status = 'PROCESSED'
        WHERE transaction_id = v_transaction_ids(i);
    COMMIT;
END;