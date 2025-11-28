create database DemoDB;
use DemoDB;

CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50),
    productName VARCHAR(100),
    productPrice DECIMAL(10,2),
    productAmount INT,
    productDescription VARCHAR(255),
    productStatus TINYINT
);

INSERT INTO Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
('P001','Iphone 15', 25000, 10, 'Điện thoại Apple', 1),
('P002','Samsung S24', 18000, 15, 'Điện thoại Samsung', 1),
('P003','Oppo Reno10', 12000, 20, 'Điện thoại Oppo', 1),
('P004','Iphone 13', 15000, 8, 'Điện thoại Apple', 0);

CREATE UNIQUE INDEX idx_productCode ON Products(productCode);
CREATE INDEX idx_name_price ON Products(productName, productPrice);
EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';

CREATE VIEW view_product_info AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

SELECT * FROM view_product_info;
DROP VIEW view_product_info;

DELIMITER //
CREATE PROCEDURE sp_get_all_products()
BEGIN
    SELECT * FROM Products;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_add_product(
    IN p_code VARCHAR(50),
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_amount INT,
    IN p_desc VARCHAR(255),
    IN p_status TINYINT
)
BEGIN
    INSERT INTO Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES(p_code, p_name, p_price, p_amount, p_desc, p_status);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_get_product_by_id(IN p_id INT)
BEGIN
    SELECT * FROM Products WHERE id = p_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_delete_product(IN p_id INT)
BEGIN
    DELETE FROM Products WHERE id = p_id;
END //
DELIMITER ;

