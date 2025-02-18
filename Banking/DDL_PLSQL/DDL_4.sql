-- 4. Create Table for error_logs

CREATE TABLE error_logs (
    error_id NUMBER PRIMARY KEY,
    error_message VARCHAR2(255),
    error_date DATE DEFAULT SYSDATE
);