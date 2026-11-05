


```mermaid
 classDiagram
    class InterestAdjustmentPeriodicity
    click InterestAdjustmentPeriodicity href "../InterestAdjustmentPeriodicity"
      InterestAdjustmentPeriodicity : customElection
        
      InterestAdjustmentPeriodicity : standardElection
        
          
    
        
        
        InterestAdjustmentPeriodicity --> "0..1" InterestAdjustmentPeriodicityEnum : standardElection
        click InterestAdjustmentPeriodicityEnum href "../InterestAdjustmentPeriodicityEnum"
    

        
      
```
