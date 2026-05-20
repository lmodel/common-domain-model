


```mermaid
 classDiagram
    class Period
    click Period href "../Period"
      Period <|-- Offset
        click Offset href "../Offset"
      Period <|-- BusinessDayOffset
        click BusinessDayOffset href "../BusinessDayOffset"
      
      Period : period
        
          
    
        
        
        Period --> "1" PeriodEnum : period
        click PeriodEnum href "../PeriodEnum"
    

        
      Period : periodMultiplier
        
      
```
