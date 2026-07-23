-- ============================================================================
-- Description: Create script for EMPLOYEE table in Trino (memory catalog)
-- Engine: Trino SQL
-- Task: Create EMPLOYEE table and load CSV data
-- ============================================================================

CREATE TABLE IF NOT EXISTS memory.default.employee (
    employee_id TINYINT,
    employee_name VARCHAR,
    manager_id TINYINT
);
