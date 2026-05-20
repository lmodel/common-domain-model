


```mermaid
 classDiagram
    class ResolutionValue
    click ResolutionValue href "../ResolutionValue"
      ResolutionValue : additionalLanguage
        
      ResolutionValue : cash
        
          
    
        
        
        ResolutionValue --> "0..1" ValueCashEnum : cash
        click ValueCashEnum href "../ValueCashEnum"
    

        
      ResolutionValue : fallback
        
      ResolutionValue : securities
        
          
    
        
        
        ResolutionValue --> "0..1" ValueSecuritiesEnum : securities
        click ValueSecuritiesEnum href "../ValueSecuritiesEnum"
    

        
      
```
