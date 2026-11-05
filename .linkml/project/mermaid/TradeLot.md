


```mermaid
 classDiagram
    class TradeLot
    click TradeLot href "../TradeLot"
      TradeLot : lotIdentifier
        
          
    
        
        
        TradeLot --> "*" Identifier : lotIdentifier
        click Identifier href "../Identifier"
    

        
      TradeLot : priceQuantity
        
          
    
        
        
        TradeLot --> "1..*" PriceQuantity : priceQuantity
        click PriceQuantity href "../PriceQuantity"
    

        
      
```
