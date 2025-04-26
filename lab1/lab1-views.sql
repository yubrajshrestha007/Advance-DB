CREATE VIEW CustomerOrderSummary AS
SELECT
    c.CustomerId,
    c.Name,
    COUNT(po.PurchaseOrderId) AS TotalOrders,
    COALESCE(SUM(po.PaymentTotal), 0) AS TotalAmount
FROM Customer c
LEFT JOIN PurchaseOrder po ON po.CustomerRef_Id = c.CustomerId
GROUP BY c.CustomerId, c.Name;
