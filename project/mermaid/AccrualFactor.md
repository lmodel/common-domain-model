


```mermaid
 classDiagram
    class AccrualFactor
    click AccrualFactor href "../AccrualFactor"
      AccrualFactor : calculationTerms
        
          
    
        
        
        AccrualFactor --> "0..1" AccrualFactorCalculationTerms : calculationTerms
        click AccrualFactorCalculationTerms href "../AccrualFactorCalculationTerms"
    

        
      AccrualFactor : value
        
          
    
        
        
        AccrualFactor --> "1" PriceSchedule : value
        click PriceSchedule href "../PriceSchedule"
    

        
      
```
