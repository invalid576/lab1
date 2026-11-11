-- ============================================================================
-- 9 ВАРИАНТ: СОЗДАНИЕ ТАБЛИЦ И ИХ ЗАПОЛНЕНИЕ
-- ============================================================================

-- Удаляем старые таблицы, если они были (сначала дочернюю, потом главную)
DROP TABLE IF EXISTS "orders" CASCADE;
DROP TABLE IF EXISTS "clients" CASCADE;

-- 1. Создание главной таблицы "Клиенты" (Clients)
CREATE TABLE "clients" (
    "client_code"            SERIAL PRIMARY KEY, -- Автоинкремент для первичного ключа
    "last_name"              VARCHAR(100) NOT NULL,
    "first_name"             VARCHAR(100) NOT NULL,
    "middle_name"            VARCHAR(100),
    "birth_date"             DATE,
    "company_representative" VARCHAR(150),
    "address"                VARCHAR(255) NOT NULL,
    "contact_phone"          VARCHAR(50)
);

-- 2. Создание зависимой таблицы "Заказы" (Orders)
CREATE TABLE "orders" (
    "order_number"         SERIAL PRIMARY KEY, -- Автоинкремент для первичного ключа
    "client_code"          INTEGER NOT NULL,
    "order_date"           DATE NOT NULL,
    "assembly_deadline"    DATE NOT NULL,
    "additional_info"      TEXT,
    "delivery_address"     VARCHAR(255) NOT NULL,
    
    -- Ограничение: срок сборки не может быть раньше даты заказа
    CONSTRAINT chk_dates CHECK ("assembly_deadline" >= "order_date"),
    
    -- Внешний ключ с каскадным обновлением и удалением
    CONSTRAINT fk_order_client 
        FOREIGN KEY ("client_code") 
        REFERENCES "clients" ("client_code")
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

-- ============================================================================
-- ЗАПОЛНЕНИЕ ТАБЛИЦ (по 10 записей в каждую)
-- ============================================================================

-- Заполняем "Клиенты"
INSERT INTO "clients" 
("last_name", "first_name", "middle_name", "birth_date", "company_representative", "address", "contact_phone")
VALUES
('Ivanov', 'Ivan', 'Ivanovich', '1985-05-15', 'TechCorp LLC', 'Moscow, Lenina St. 10', '+7-999-111-2233'),
('Petrova', 'Anna', 'Sergeevna', '1990-08-20', 'Design Studio', 'St. Petersburg, Nevsky Pr. 45', '+7-999-444-5566'),
('Sidorov', 'Alexey', 'Vladimirovich', '1978-12-01', NULL, 'Kazan, Baumana St. 7', '+7-999-777-8899'),
('Smirnova', 'Elena', 'Andreevna', '1995-03-10', 'Marketing Plus', 'Novosibirsk, Kirova St. 12', '+7-999-222-3344'),
('Kuznetsov', 'Dmitry', 'Olegovich', '1982-07-22', NULL, 'Yekaterinburg, Mira St. 33', '+7-999-555-6677'),
('Popova', 'Maria', 'Igorevna', '1993-11-05', 'IT Solutions', 'Moscow, Tverskaya St. 5', '+7-999-888-9900'),
('Vasiliev', 'Sergey', 'Petrovich', '1988-02-14', NULL, 'Nizhny Novgorod, Gorky St. 15', '+7-999-333-4455'),
('Sokolova', 'Olga', 'Dmitrievna', '1991-09-30', 'Finance Group', 'Moscow, Arbat St. 20', '+7-999-666-7788'),
('Mikhailov', 'Andrey', 'Andreevich', '1980-04-18', 'Logistics Pro', 'Rostov-on-Don, Sadovaya St. 8', '+7-999-123-4567'),
('Fedorova', 'Tatiana', 'Yurievna', '1997-01-25', NULL, 'Moscow, Lomonosov St. 3', '+7-999-987-6543');

-- Заполняем "Заказы"
INSERT INTO "orders" 
("client_code", "order_date", "assembly_deadline", "additional_info", "delivery_address")
VALUES
(1, '2023-10-01', '2023-10-05', 'Fragile items inside', 'Moscow, Lenina St. 10'),
(2, '2023-10-02', '2023-10-07', 'Call before delivery', 'St. Petersburg, Nevsky Pr. 45'),
(3, '2023-10-03', '2023-10-08', 'Leave at the front desk', 'Kazan, Baumana St. 7'),
(4, '2023-10-04', '2023-10-06', NULL, 'Novosibirsk, Kirova St. 12'),
(5, '2023-10-05', '2023-10-10', 'Urgent order', 'Yekaterinburg, Mira St. 33'),
(6, '2023-10-06', '2023-10-12', 'Requires signature', 'Moscow, Tverskaya St. 5'),
(1, '2023-10-07', '2023-10-09', 'Second order from this client', 'Moscow, Lenina St. 10'),
(8, '2023-10-08', '2023-10-15', NULL, 'Moscow, Arbat St. 20'),
(9, '2023-10-09', '2023-10-14', 'Heavy box', 'Rostov-on-Don, Sadovaya St. 8'),
(10,'2023-10-10', '2023-10-13', 'Do not bend', 'Moscow, Lomonosov St. 3');