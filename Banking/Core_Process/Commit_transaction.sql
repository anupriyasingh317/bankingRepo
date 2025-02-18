--16. Procedure: commit_transaction

CREATE OR REPLACE PROCEDURE commit_transaction IS
BEGIN
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Transaction committed successfully.');
END commit_transaction;