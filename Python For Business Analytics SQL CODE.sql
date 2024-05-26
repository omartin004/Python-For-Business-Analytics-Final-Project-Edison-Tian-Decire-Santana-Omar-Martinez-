SELECT [dbo].[OrderData].Order_Id, ROUND(Order_Profit_Per_Order,1) AS Order_Profit_Per_Order, 
ROUND(Order_Item_Profit_Ratio,1) AS Order_Item_Profit_Ratio, Order_Item_Quantity, ROUND(Order_Item_Total,1) AS Order_Item_Total, 
Delivery_Status, Shipping_Mode, [dbo].[ShippingData].Order_Id
FROM [dbo].[OrderData] LEFT JOIN [dbo].[ShippingData]
ON [dbo].[OrderData].Order_Id = [dbo].[ShippingData].Order_Id

SELECT [dbo].[ShippingData].Order_Id, Delivery_Status, Shipping_Mode, shipping_date_DateOrders, 
Category_Id, Category_Name, Product_Category_Id, Product_Price
FROM[dbo].[ShippingData] LEFT JOIN [dbo].[ProductData]
ON [dbo].[ShippingData].Order_Id = [dbo].[ProductData].[Product_Category_Id]

SELECT OrderData.Order_Region,
    ROUND(OrderData.Sales,0) AS Rounded_Sales,
    OrderData.Order_Item_Profit_Ratio,
    ShippingData.Order_Id,
    ShippingData.Days_for_shipping_real,
    ShippingData.Days_for_shipment_scheduled

FROM OrderData
    LEFT JOIN ShippingData
        ON OrderData.Order_Id = ShippingData.Order_Id