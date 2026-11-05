


```mermaid
 classDiagram
    class AveragingCalculation
    click AveragingCalculation href "../AveragingCalculation"
      AveragingCalculation : averagingMethod
        
          
    
        
        
        AveragingCalculation --> "1" AveragingCalculationMethod : averagingMethod
        click AveragingCalculationMethod href "../AveragingCalculationMethod"
    

        
      AveragingCalculation : precision
        
          
    
        
        
        AveragingCalculation --> "1" Rounding : precision
        click Rounding href "../Rounding"
    

        
      
```
