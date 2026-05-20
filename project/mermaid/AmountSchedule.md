


```mermaid
 classDiagram
    class AmountSchedule
    click AmountSchedule href "../AmountSchedule"
      Schedule <|-- AmountSchedule
        click Schedule href "../Schedule"
      
      AmountSchedule : currency
        
      AmountSchedule : datedValue
        
          
    
        
        
        AmountSchedule --> "*" DatedValue : datedValue
        click DatedValue href "../DatedValue"
    

        
      AmountSchedule : value
        
      
```
