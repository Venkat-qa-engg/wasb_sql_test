-- 1. Create INVOICE table
CREATE TABLE IF NOT EXISTS memory.default.invoices (
    supplier_id TINYINT,
    invoice_ammount DECIMAL(8, 2),
    due_date DATE
);

-- 2. Create SUPPLIER table
CREATE TABLE IF NOT EXISTS memory.default.suppliers (
    supplier_id TINYINT,
    name VARCHAR
);

-- 3. Populate SUPPLIERS (Assigning a unique TINYINT ID to each company name)
INSERT INTO memory.default.suppliers (supplier_id, name) VALUES
(1, 'Party Animals'),
(2, 'Brilliant Bottles'),
(3, 'crazy_catering'),
(4, 'disco_dj'),
(5, 'excellent_entertainment'),
(6, 'fantastic_ice_sculptures'),

-- 4. Populate INVOICES (Using the matching supplier_id, amount, and due date)
INSERT INTO memory.default.invoices (supplier_id, invoice_ammount, due_date) VALUES
(1, 6000.00, DATE '2026-10-23'),
(2, 2000.00, DATE '2026-09-23'),
(3, 1500.00, DATE '2026-10-23'),
(4, 500.00, DATE '2026-08-23'),
(5, 6000.00, DATE '2026-10-23'),
(6, 4000.00, DATE '2027-01-23');



