SELECT
    p.Name AS ProductName,
    pc.CategoryName
FROM Product p
JOIN ProductCategory pc ON p.ProductCategoryRef_Id = pc.CategoryId;
