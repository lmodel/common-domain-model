


```mermaid
 classDiagram
    class PercentageRule
    click PercentageRule href "../PercentageRule"
      PercentageRule : notionalAmountReference
        
          
    
        
        
        PercentageRule --> "1" Money : notionalAmountReference
        click Money href "../Money"
    

        
      PercentageRule : paymentPercent
        
      
```
