DELIMITER //

CREATE PROCEDURE ApplyMarkup(IN markup_percent DECIMAL(5,2), IN cat_id INT)
BEGIN
    UPDATE Product 
    SET Price = Price + (Price * markup_percent / 100)
    WHERE ProductCategoryRef_Id = cat_id;

    SELECT COUNT(*) AS TotalItems FROM Product WHERE ProductCategoryRef_Id = cat_id;
END //

DELIMITER ;
