-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example. 

USE SalesOrdersSample;
GO

SELECT C.CustomerID, C.CustFirstName, C.CustLastName
FROM Customers AS C
WHERE C.CustomerID IN 
  (SELECT CustomerID FROM Orders
  INNER JOIN Order_Details
  ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products
  ON Products.ProductNumber = Order_Details.ProductNumber
  WHERE Products.ProductName 
    IN ('Skateboard', 'Helmet', 'Knee Pads', 'Gloves'));
