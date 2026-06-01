-- =====================================================
-- PROCEDURE PARA GERAR DADOS
-- =====================================================
USE WLEcom;
DELIMITER $$

CREATE PROCEDURE populate_sales()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_quantity INT;
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_customer_id INT;
    DECLARE v_product VARCHAR(100);
    DECLARE v_channel VARCHAR(50);
    DECLARE v_payment VARCHAR(50);

    WHILE i <= 200 DO

        SET v_quantity = FLOOR(1 + RAND() * 5);
        SET v_price = ROUND(100 + RAND() * 1900, 2);
        SET v_customer_id = FLOOR(1 + RAND() * 50);
        SET v_product =
            CASE FLOOR(RAND() * 10)
                WHEN 0 THEN 'Notebook'
                WHEN 1 THEN 'Mouse'
                WHEN 2 THEN 'Teclado'
                WHEN 3 THEN 'Monitor'
                WHEN 4 THEN 'Headset'
                WHEN 5 THEN 'Webcam'
                WHEN 6 THEN 'SSD'
                WHEN 7 THEN 'HD Externo'
                WHEN 8 THEN 'Impressora'
                ELSE 'Cadeira Gamer'
            END;

        SET v_channel =
            CASE FLOOR(RAND() * 4)
                WHEN 0 THEN 'Site'
                WHEN 1 THEN 'Marketplace'
                WHEN 2 THEN 'WhatsApp'
                ELSE 'Loja Fisica'
            END;

        SET v_payment =
            CASE FLOOR(RAND() * 4)
                WHEN 0 THEN 'PIX'
                WHEN 1 THEN 'Cartao Credito'
                WHEN 2 THEN 'Cartao Debito'
                ELSE 'Boleto'
            END;

        INSERT INTO sales (
            sale_date,
            customer_id,
            customer_name,
            product_name,
            quantity,
            unit_price,
            total_amount,
            sales_channel,
            payment_method
        )
        VALUES (
            DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 180) DAY),
            v_customer_id,
            CONCAT('Cliente ', v_customer_id),
            v_product,
            v_quantity,
            v_price,
            ROUND(v_quantity * v_price, 2),
            v_channel,
            v_payment
        );

        SET i = i + 1;

    END WHILE;

END$$

DELIMITER ;

-- =====================================================
-- POPULAR TABELA
-- =====================================================

CALL populate_sales();

-- =====================================================
-- VALIDAÇÃO
-- =====================================================

SELECT COUNT(*) AS total_registros
FROM sales;

SELECT *
FROM sales
LIMIT 10;