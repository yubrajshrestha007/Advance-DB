SELECT
    p.Name AS ProductName,
    p.Price AS ProductPrice,
    pc.CategoryName
FROM Product p
LEFT JOIN ProductCategory pc ON p.ProductCategoryRef_Id = pc.CategoryId
ORDER BY p.Name;
