-- Triggers for auto-increment
CREATE OR REPLACE TRIGGER trg_productcategory
BEFORE INSERT ON ProductCategory
FOR EACH ROW
BEGIN
    SELECT seq_productcategory.NEXTVAL INTO :NEW.CategoryId FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_product
BEFORE INSERT ON Product
FOR EACH ROW
BEGIN
    SELECT seq_product.NEXTVAL INTO :NEW.ProductId FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_country
BEFORE INSERT ON Country
FOR EACH ROW
BEGIN
    SELECT seq_country.NEXTVAL INTO :NEW.CountryId FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_address
BEFORE INSERT ON Address
FOR EACH ROW
BEGIN
    SELECT seq_address.NEXTVAL INTO :NEW.AddressId FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_customer
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    SELECT seq_customer.NEXTVAL INTO :NEW.CustomerId FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_purchaseorder
BEFORE INSERT ON PurchaseOrder
FOR EACH ROW
BEGIN
    SELECT seq_purchaseorder.NEXTVAL INTO :NEW.PurchaseOrderId FROM dual;
END;
/
