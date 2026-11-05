


```mermaid
 classDiagram
    class AssetDeliveryProfileBlock
    click AssetDeliveryProfileBlock href "../AssetDeliveryProfileBlock"
      AssetDeliveryProfileBlock : dayOfWeek
        
          
    
        
        
        AssetDeliveryProfileBlock --> "*" DayOfWeekEnum : dayOfWeek
        click DayOfWeekEnum href "../DayOfWeekEnum"
    

        
      AssetDeliveryProfileBlock : deliveryCapacity
        
          
    
        
        
        AssetDeliveryProfileBlock --> "0..1" Quantity : deliveryCapacity
        click Quantity href "../Quantity"
    

        
      AssetDeliveryProfileBlock : endTime
        
      AssetDeliveryProfileBlock : priceTimeIntervalQuantity
        
          
    
        
        
        AssetDeliveryProfileBlock --> "0..1" Price : priceTimeIntervalQuantity
        click Price href "../Price"
    

        
      AssetDeliveryProfileBlock : startTime
        
      
```
