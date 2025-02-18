-- 6. Create Sequence for log_id generation

CREATE SEQUENCE seq_log_id START WITH 1 INCREMENT BY 1;

----------------------------------------------------------

-- 7. Create View for Transaction Summary (using a subquery alias)

CREATE VIEW v_transaction_summary AS
SELECT ct.customer_id,
       SUM(ct.transaction_amount) AS total_amount
FROM customer_transactions ct
GROUP BY ct.customer_id;