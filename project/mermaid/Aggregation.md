


```mermaid
 classDiagram
    class Aggregation
    click Aggregation href "../Aggregation"
      Aggregation : aggregationType
        
          
    
        
        
        Aggregation --> "1" AggregationSpecificationEnum : aggregationType
        click AggregationSpecificationEnum href "../AggregationSpecificationEnum"
    

        
      Aggregation : loansCanBeGrouped
        
      Aggregation : otherDetails
        
      
```
