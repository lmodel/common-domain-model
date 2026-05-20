


```mermaid
 classDiagram
    class InterestAdjustment
    click InterestAdjustment href "../InterestAdjustment"
      InterestAdjustment : isApplicable
        
      InterestAdjustment : periodicity
        
          
    
        
        
        InterestAdjustment --> "1" InterestAdjustmentPeriodicity : periodicity
        click InterestAdjustmentPeriodicity href "../InterestAdjustmentPeriodicity"
    

        
      
```
