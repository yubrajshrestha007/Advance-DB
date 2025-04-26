SELECT
    ProductCategoryRef_Id AS CategoryId,
    COUNT(*) AS ProductCount,
    SUM(Price) AS TotalPrice
FROM Product
GROUP BY ProductCategoryRef_Id;
