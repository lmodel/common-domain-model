


```mermaid
 classDiagram
    class AssetDeliveryInformation
    click AssetDeliveryInformation href "../AssetDeliveryInformation"
      AssetDeliveryInformation : commodityGrade
        
          
    
        
        
        AssetDeliveryInformation --> "*" ProductGradeEnum : commodityGrade
        click ProductGradeEnum href "../ProductGradeEnum"
    

        
      AssetDeliveryInformation : deliveryCapacity
        
          
    
        
        
        AssetDeliveryInformation --> "0..1" Quantity : deliveryCapacity
        click Quantity href "../Quantity"
    

        
      AssetDeliveryInformation : location
        
          
    
        
        
        AssetDeliveryInformation --> "*" LocationIdentifier : location
        click LocationIdentifier href "../LocationIdentifier"
    

        
      AssetDeliveryInformation : periods
        
          
    
        
        
        AssetDeliveryInformation --> "0..1" AssetDeliveryPeriods : periods
        click AssetDeliveryPeriods href "../AssetDeliveryPeriods"
    

        
      
```
