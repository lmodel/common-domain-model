


```mermaid
 classDiagram
    class DeterminationMethodology
    click DeterminationMethodology href "../DeterminationMethodology"
      DeterminationMethodology : averagingMethod
        
          
    
        
        
        DeterminationMethodology --> "0..1" AveragingCalculationMethodEnum : averagingMethod
        click AveragingCalculationMethodEnum href "../AveragingCalculationMethodEnum"
    

        
      DeterminationMethodology : determinationMethod
        
          
    
        
        
        DeterminationMethodology --> "0..1" DeterminationMethodEnum : determinationMethod
        click DeterminationMethodEnum href "../DeterminationMethodEnum"
    

        
      
```
