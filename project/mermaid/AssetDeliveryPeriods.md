


```mermaid
 classDiagram
    class AssetDeliveryPeriods
    click AssetDeliveryPeriods href "../AssetDeliveryPeriods"
      AssetDeliveryPeriods <|-- CalculationScheduleDeliveryPeriods
        click CalculationScheduleDeliveryPeriods href "../CalculationScheduleDeliveryPeriods"
      
      AssetDeliveryPeriods : endDate
        
      AssetDeliveryPeriods : profile
        
          
    
        
        
        AssetDeliveryPeriods --> "*" AssetDeliveryProfile : profile
        click AssetDeliveryProfile href "../AssetDeliveryProfile"
    

        
      AssetDeliveryPeriods : startDate
        
      
```
