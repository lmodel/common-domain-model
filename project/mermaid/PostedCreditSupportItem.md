


```mermaid
 classDiagram
    class PostedCreditSupportItem
    click PostedCreditSupportItem href "../PostedCreditSupportItem"
      PostedCreditSupportItem : additionalHaircutPercentage
        
      PostedCreditSupportItem : cashOrSecurityValue
        
          
    
        
        
        PostedCreditSupportItem --> "1" Money : cashOrSecurityValue
        click Money href "../Money"
    

        
      PostedCreditSupportItem : disputedCashOrSecurityValue
        
          
    
        
        
        PostedCreditSupportItem --> "1" Money : disputedCashOrSecurityValue
        click Money href "../Money"
    

        
      PostedCreditSupportItem : fxHaircutPercentage
        
      PostedCreditSupportItem : haircutPercentage
        
      
```
