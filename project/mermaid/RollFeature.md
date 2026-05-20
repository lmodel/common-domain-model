


```mermaid
 classDiagram
    class RollFeature
    click RollFeature href "../RollFeature"
      RollFeature : deliveryDateRollConvention
        
          
    
        
        
        RollFeature --> "0..1" Offset : deliveryDateRollConvention
        click Offset href "../Offset"
    

        
      RollFeature : rollSourceCalendar
        
          
    
        
        
        RollFeature --> "0..1" RollSourceCalendarEnum : rollSourceCalendar
        click RollSourceCalendarEnum href "../RollSourceCalendarEnum"
    

        
      
```
