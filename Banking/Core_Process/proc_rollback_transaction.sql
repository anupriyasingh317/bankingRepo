--17. Procedure: rollback_transaction

CREATE OR REPLACE PROCEDURE rollback_transaction IS
BEGIN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Transaction rolled back due to an error.');
END rollback_transaction;