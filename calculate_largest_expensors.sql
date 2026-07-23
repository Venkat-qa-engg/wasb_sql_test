-- ============================================================================
-- Description: Identify high-value expensors exceeding handbook policy (>1000)
-- Task: Aggregate unit_price * quantity and join employee/manager details
-- Optimization: Aggregate expenses first before joining dimension tables
-- ============================================================================

WITH aggregated_expenses AS (
    -- Pre-aggregate expense totals per employee to reduce JOIN cardinality
    SELECT 
        employee_id,
        SUM(unit_price * quantity) AS total_expensed_amount
    FROM memory.default.expense
    GROUP BY employee_id
    HAVING SUM(unit_price * quantity) > 1000.00
)
SELECT 
    e.employee_id,
    e.employee_name,
    e.manager_id,
    COALESCE(m.employee_name, 'No Manager Assigned') AS manager_name,
    ae.total_expensed_amount
FROM aggregated_expenses ae
JOIN memory.default.employee e ON ae.employee_id = e.employee_id
LEFT JOIN memory.default.employee m ON e.manager_id = m.employee_id
ORDER BY ae.total_expensed_amount DESC;
