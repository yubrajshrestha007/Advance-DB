SELECT
    MAX(Price) AS MaxPrice,
    MIN(Price) AS MinPrice,
    ROUND(AVG(Price), 2) AS AvgPrice
FROM Product;
