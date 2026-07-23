WITH RECURSIVE management_chain (employee_id, employee_name, manager_id, path, is_cycle) AS (
    SELECT 
        employee_id,
        employee_name,
        manager_id,
        ARRAY[employee_id] AS path,
        false AS is_cycle
    FROM memory.default.employee
    
    UNION ALL
    
    SELECT 
        e.employee_id,
        e.employee_name,
        e.manager_id,
        mc.path || e.employee_id,
        CONTAINS(mc.path, e.employee_id) AS is_cycle
    FROM memory.default.employee e
    JOIN management_chain mc ON e.manager_id = mc.employee_id
    WHERE NOT mc.is_cycle
)
SELECT DISTINCT employee_id, employee_name, manager_id
FROM management_chain
WHERE is_cycle = true;
