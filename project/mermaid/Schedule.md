


```mermaid
 classDiagram
    class Schedule
    click Schedule href "../Schedule"
      Schedule <|-- AmountSchedule
        click AmountSchedule href "../AmountSchedule"
      
      Schedule : datedValue
        
          
    
        
        
        Schedule --> "*" DatedValue : datedValue
        click DatedValue href "../DatedValue"
    

        
      Schedule : value
        
      
```
