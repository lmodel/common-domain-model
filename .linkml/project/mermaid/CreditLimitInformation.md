


```mermaid
 classDiagram
    class CreditLimitInformation
    click CreditLimitInformation href "../CreditLimitInformation"
      CreditLimitInformation : limitApplicable
        
          
    
        
        
        CreditLimitInformation --> "1..*" LimitApplicableExtended : limitApplicable
        click LimitApplicableExtended href "../LimitApplicableExtended"
    

        
      
```
