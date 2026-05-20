


```mermaid
 classDiagram
    class ConcentrationLimit
    click ConcentrationLimit href "../ConcentrationLimit"
      ConcentrationLimit : concentrationLimitCriteria
        
          
    
        
        
        ConcentrationLimit --> "0..1" ConcentrationLimitCriteria : concentrationLimitCriteria
        click ConcentrationLimitCriteria href "../ConcentrationLimitCriteria"
    

        
      ConcentrationLimit : percentageLimit
        
          
    
        
        
        ConcentrationLimit --> "0..1" NumberRange : percentageLimit
        click NumberRange href "../NumberRange"
    

        
      ConcentrationLimit : valueLimit
        
          
    
        
        
        ConcentrationLimit --> "0..1" MoneyRange : valueLimit
        click MoneyRange href "../MoneyRange"
    

        
      
```
