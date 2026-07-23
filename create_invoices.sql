CREATE TABLE IF NOT EXISTS memory.default.invoices (
    invoice_id VARCHAR,
    supplier_id VARCHAR,
    invoice_date DATE,
    due_date DATE,
    amount DOUBLE
);
