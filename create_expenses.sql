-- 1. Create table according to README requirements
CREATE TABLE IF NOT EXISTS memory.default.expenses (
    employee_id TINYINT,
    unit_price DECIMAL(8, 2),
    quantity TINYINT
);

-- 2. Populate values extracted from the text files in finance/receipts_from_last_night
INSERT INTO memory.default.expenses (employee_id, unit_price, quantity) VALUES
(1, 6.50, 14),
(2, 11.00, 20),
(3, 22.00, 18),
(4, 13.00, 75),
(5, 300.00, 1),
(6, 40.00, 9),
(7, 75.00, 4);
