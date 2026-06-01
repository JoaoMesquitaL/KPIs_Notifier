-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: wlecom
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'wlecom'
--
/*!50003 DROP PROCEDURE IF EXISTS `populate_sales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `populate_sales`()
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-01 16:16:43
