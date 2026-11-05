


```mermaid
 classDiagram
    class RateSchedule
    click RateSchedule href "../RateSchedule"
      RateSchedule <|-- SpreadSchedule
        click SpreadSchedule href "../SpreadSchedule"
      RateSchedule <|-- StrikeSchedule
        click StrikeSchedule href "../StrikeSchedule"
      
      RateSchedule : price
        
          
    
        
        
        RateSchedule --> "1" PriceSchedule : price
        click PriceSchedule href "../PriceSchedule"
    

        
      
```
