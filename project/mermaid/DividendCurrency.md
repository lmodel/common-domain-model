


```mermaid
 classDiagram
    class DividendCurrency
    click DividendCurrency href "../DividendCurrency"
      DividendCurrency : currency
        
      DividendCurrency : currencyReference
        
      DividendCurrency : determinationMethod
        
          
    
        
        
        DividendCurrency --> "0..1" DeterminationMethodEnum : determinationMethod
        click DeterminationMethodEnum href "../DeterminationMethodEnum"
    

        
      
```
