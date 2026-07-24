-- ============================================================================
-- Description: Create script for EMPLOYEE table in Trino (memory catalog)
-- Engine: Trino SQL
-- Task: Create EMPLOYEE table and load CSV data
-- ============================================================================

CREATE TABLE IF NOT EXISTS memory.default.employee (
    employee_id TINYINT,
    first_name VARCHAR,
    last_name VARCHAR,
    job_title VARCHAR,
    manager_id TINYINT
);

INSERT INTO memory.default.employee (employee_id, first_name, last_name, job_title, manager_id)
VALUES 
    (1, 'Ian', 'James', 'CEO', 4),
    (2, 'Umberto', 'Torrielli', 'CSO', 1),
    (3, 'Alex', 'Jacobson', 'MD EMEA', 2),
    (4, 'Darren', 'Poynton', 'CFO', 2),
    (5, 'Tim', 'Beard', 'MD APAC', 2),
    (6, 'Gemma', 'Dodd', 'COS', 1),
    (7, 'Lisa', 'Platten', 'CHR', 6),
    (8, 'Stefano', 'Camisaca', 'GM Activation', 2),
    (9, 'Andrea', 'Ghibaudi', 'MD NAM', 2);
