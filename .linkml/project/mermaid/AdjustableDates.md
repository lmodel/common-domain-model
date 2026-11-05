


```mermaid
 classDiagram
    class AdjustableDates
    click AdjustableDates href "../AdjustableDates"
      AdjustableDates : adjustedDate
        
      AdjustableDates : dateAdjustments
        
          
    
        
        
        AdjustableDates --> "0..1" BusinessDayAdjustments : dateAdjustments
        click BusinessDayAdjustments href "../BusinessDayAdjustments"
    

        
      AdjustableDates : unadjustedDate
        
      
```
