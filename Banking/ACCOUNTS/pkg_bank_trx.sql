CREATE OR REPLACE PACKAGE bank_pkg AS
   -- This function calls the existing CALCULATE_BALANCE function and subtracts a fixed fee (e.g., $5).
   FUNCTION get_adjusted_balance(
      p_account_id IN NUMBER,
      p_trans_amt IN NUMBER
   ) RETURN NUMBER;

   -- PROCESS_PAYMENT:
   -- This procedure retrieves the transaction amount from CUSTOMER_TRANSACTIONS and,
   -- if the amount meets the minimum threshold (e.g., $50), calls the existing
   -- standalone PROCESS_TRANSACTIONS procedure to process the transaction.
   PROCEDURE process_payment(p_trans_id IN NUMBER);
  
END bank_pkg;
/

CREATE OR REPLACE PACKAGE BODY bank_pkg AS

   ----------------------------------------------------------------
   -- get_adjusted_balance:
   -- Calls the existing CALCULATE_BALANCE function and subtracts a fixed fee.
   ----------------------------------------------------------------
   FUNCTION get_adjusted_balance(
      p_account_id IN NUMBER,
      p_trans_amt IN NUMBER
   ) RETURN NUMBER IS
      v_new_balance NUMBER(10,2);
      v_fee NUMBER(10,2) := 5; -- Fixed fee of $5
   BEGIN
      -- Call the existing standalone function CALCULATE_BALANCE.
      v_new_balance := calculate_balance(p_account_id, p_trans_amt);
      RETURN v_new_balance - v_fee;
   EXCEPTION
      WHEN OTHERS THEN
         DBMS_OUTPUT.PUT_LINE('Error in get_adjusted_balance: ' || SQLERRM);
         RETURN NULL;
   END get_adjusted_balance;

   ----------------------------------------------------------------
   -- process_payment:
   -- Retrieves the transaction amount from CUSTOMER_TRANSACTIONS;
   -- if the amount meets the minimum threshold, it calls the existing
   -- standalone procedure PROCESS_TRANSACTIONS to process the transaction.
   ----------------------------------------------------------------
   PROCEDURE process_payment(p_trans_id IN NUMBER) IS
      v_trans_amt customer_transactions.transaction_amount%TYPE;
      v_minimum CONSTANT NUMBER(10,2) := 50; -- Minimum threshold of $50
   BEGIN
      -- Retrieve the transaction amount for the given transaction.
      SELECT transaction_amount
        INTO v_trans_amt
        FROM customer_transactions
        WHERE transaction_id = p_trans_id;
      
      IF v_trans_amt < v_minimum THEN
         RAISE_APPLICATION_ERROR(-20003, 'Transaction ' || p_trans_id || ' amount is below the minimum threshold.');
      ELSE
         DBMS_OUTPUT.PUT_LINE('Transaction ' || p_trans_id || ' meets minimum threshold. Processing payment...');
         -- Call the existing standalone procedure PROCESS_TRANSACTION.
         process_transactions;
      END IF;
   EXCEPTION
      WHEN OTHERS THEN
         DBMS_OUTPUT.PUT_LINE('Error in process_payment: ' || SQLERRM);
         ROLLBACK;
   END process_payment;

END bank_pkg;

