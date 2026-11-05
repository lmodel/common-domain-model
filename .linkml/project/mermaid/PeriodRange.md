


```mermaid
 classDiagram
    class PeriodRange
    click PeriodRange href "../PeriodRange"
      PeriodRange : lowerBound
        
          
    
        
        
        PeriodRange --> "0..1" PeriodBound : lowerBound
        click PeriodBound href "../PeriodBound"
    

        
      PeriodRange : upperBound
        
          
    
        
        
        PeriodRange --> "0..1" PeriodBound : upperBound
        click PeriodBound href "../PeriodBound"
    

        
      
```
