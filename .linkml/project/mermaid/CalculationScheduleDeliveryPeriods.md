


```mermaid
 classDiagram
    class CalculationScheduleDeliveryPeriods
    click CalculationScheduleDeliveryPeriods href "../CalculationScheduleDeliveryPeriods"
      AssetDeliveryPeriods <|-- CalculationScheduleDeliveryPeriods
        click AssetDeliveryPeriods href "../AssetDeliveryPeriods"
      
      CalculationScheduleDeliveryPeriods : deliveryCapacity
        
          
    
        
        
        CalculationScheduleDeliveryPeriods --> "0..1" Quantity : deliveryCapacity
        click Quantity href "../Quantity"
    

        
      CalculationScheduleDeliveryPeriods : endDate
        
      CalculationScheduleDeliveryPeriods : priceTimeIntervalQuantity
        
          
    
        
        
        CalculationScheduleDeliveryPeriods --> "0..1" Price : priceTimeIntervalQuantity
        click Price href "../Price"
    

        
      CalculationScheduleDeliveryPeriods : profile
        
          
    
        
        
        CalculationScheduleDeliveryPeriods --> "*" AssetDeliveryProfile : profile
        click AssetDeliveryProfile href "../AssetDeliveryProfile"
    

        
      CalculationScheduleDeliveryPeriods : startDate
        
      
```
