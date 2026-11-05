


```mermaid
 classDiagram
    class FxRate
    click FxRate href "../FxRate"
      FxRate : quotedCurrencyPair
        
          
    
        
        
        FxRate --> "1" QuotedCurrencyPair : quotedCurrencyPair
        click QuotedCurrencyPair href "../QuotedCurrencyPair"
    

        
      FxRate : rate
        
      
```
