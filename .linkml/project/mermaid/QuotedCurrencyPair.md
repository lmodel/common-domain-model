


```mermaid
 classDiagram
    class QuotedCurrencyPair
    click QuotedCurrencyPair href "../QuotedCurrencyPair"
      QuotedCurrencyPair : currency1
        
      QuotedCurrencyPair : currency2
        
      QuotedCurrencyPair : quoteBasis
        
          
    
        
        
        QuotedCurrencyPair --> "1" QuoteBasisEnum : quoteBasis
        click QuoteBasisEnum href "../QuoteBasisEnum"
    

        
      
```
