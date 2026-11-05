


```mermaid
 classDiagram
    class AdjustableOrAdjustedDate
    click AdjustableOrAdjustedDate href "../AdjustableOrAdjustedDate"
      AdjustableOrAdjustedDate : adjustedDate
        
      AdjustableOrAdjustedDate : dateAdjustments
        
          
    
        
        
        AdjustableOrAdjustedDate --> "0..1" BusinessDayAdjustments : dateAdjustments
        click BusinessDayAdjustments href "../BusinessDayAdjustments"
    

        
      AdjustableOrAdjustedDate : unadjustedDate
        
      
```
