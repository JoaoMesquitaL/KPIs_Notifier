-- =====================================================
-- CRIAÇÃO DO BANCO
-- =====================================================

DROP DATABASE IF EXISTS WLEcom;

CREATE DATABASE WLEcom
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE WLEcom;

-- =====================================================
-- TABELA DE VENDAS
-- =====================================================

CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_date DATE NOT NULL,
    customer_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    sales_channel VARCHAR(50) NOT NULL,
    payment_method VARCHAR(50) NOT NULL
);