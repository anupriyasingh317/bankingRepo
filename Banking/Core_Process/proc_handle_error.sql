--15. Procedure: handle_error (Error Logging)
CREATE OR REPLACE PROCEDURE handle_error(p_error_message VARCHAR2) IS
BEGIN
    INSERT INTO error_logs (error_message, error_date)
    VALUES (p_error_message, SYSDATE);
    COMMIT;
END handle_error;