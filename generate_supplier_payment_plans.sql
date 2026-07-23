WITH supplier_totals AS (
    SELECT 
        supplier_id,
        SUM(amount) AS balance_outstanding,
        MAX(due_date) AS max_due_date,
        COUNT(DISTINCT invoice_id) AS total_invoices
    FROM memory.default.invoices
    GROUP BY supplier_id
)
SELECT 
    supplier_id,
    balance_outstanding,
    max_due_date,
    ROUND(balance_outstanding / 12, 2) AS monthly_payment_amount,
    LAST_DAY_OF_MONTH(CURRENT_DATE) AS payment_date
FROM supplier_totals;
