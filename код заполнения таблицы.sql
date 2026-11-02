-- ============================================================
-- Insert test data into "clients" (Must be done first)
-- ============================================================
INSERT INTO "clients" 
("last_name", "first_name", "middle_name", "birth_date", "company_representative", "address", "contact_phone")
VALUES
('Ivanov', 'Ivan', 'Ivanovich', '1985-05-15', 'TechCorp LLC', 'Moscow, Lenina St. 10', '+7-999-111-2233'),
('Petrova', 'Anna', 'Sergeevna', '1990-08-20', 'Design Studio', 'St. Petersburg, Nevsky Pr. 45', '+7-999-444-5566'),
('Sidorov', 'Alexey', 'Vladimirovich', '1978-12-01', NULL, 'Kazan, Baumana St. 7', '+7-999-777-8899'),
('Smirnova', 'Elena', 'Andreevna', '1995-03-10', 'Marketing Plus', 'Novosibirsk, Kirova St. 12', '+7-999-222-3344');

-- ============================================================
-- Insert test data into "orders"
-- ============================================================
INSERT INTO "orders" 
("client_code", "order_date", "assembly_deadline", "additional_info", "delivery_address")
VALUES
(1, '2023-10-01', '2023-10-05', 'Fragile items inside', 'Moscow, Lenina St. 10'),
(2, '2023-10-02', '2023-10-07', 'Call before delivery', 'St. Petersburg, Nevsky Pr. 45'),
(1, '2023-10-05', '2023-10-10', 'Urgent order', 'Moscow, Lenina St. 10'),
(3, '2023-10-06', '2023-10-12', 'Leave at the front desk', 'Kazan, Baumana St. 7'),
(4, '2023-10-08', '2023-10-15', NULL, 'Novosibirsk, Kirova St. 12');

-- ============================================================
-- Verification queries (Optional)
-- ============================================================
SELECT * FROM "clients" ORDER BY "client_code";
SELECT * FROM "orders" ORDER BY "order_number";