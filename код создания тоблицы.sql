-- ============================================================
-- Drop tables if they already exist (Orders first due to FK)
-- ============================================================
DROP TABLE IF EXISTS "orders" CASCADE;
DROP TABLE IF EXISTS "clients" CASCADE;

-- ============================================================
-- Table "clients" (Клиенты)
-- ============================================================
CREATE TABLE "clients" (
    "client_code"            SERIAL       PRIMARY KEY,
    "last_name"              VARCHAR(100) NOT NULL,
    "first_name"             VARCHAR(100) NOT NULL,
    "middle_name"            VARCHAR(100),
    "birth_date"             DATE         CHECK ("birth_date" <= CURRENT_DATE),
    "company_representative" VARCHAR(150),
    "address"                VARCHAR(255),
    "contact_phone"          VARCHAR(50)
);

-- ============================================================
-- Table "orders" (Заказы)
-- ============================================================
CREATE TABLE "orders" (
    "order_number"         SERIAL       PRIMARY KEY,
    "client_code"          INTEGER      NOT NULL,
    "order_date"           DATE         NOT NULL DEFAULT CURRENT_DATE,
    "assembly_deadline"    DATE         NOT NULL,
    "additional_info"      TEXT,
    "delivery_address"     VARCHAR(255) NOT NULL,
    
    -- Foreign Key linking to clients table
    CONSTRAINT fk_order_client 
        FOREIGN KEY ("client_code") 
        REFERENCES "clients" ("client_code")
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        
    -- Ensure assembly deadline is not before the order date
    CONSTRAINT chk_dates CHECK ("assembly_deadline" >= "order_date")
);