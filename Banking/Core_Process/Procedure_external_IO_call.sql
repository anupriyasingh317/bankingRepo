--8. Procedure: external_IO_call (Simulated IO Call)

CREATE OR REPLACE PROCEDURE external_IO_call(p_transaction_id NUMBER) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Calling external service for transaction validation: ' || p_transaction_id);
    END external_IO_call;