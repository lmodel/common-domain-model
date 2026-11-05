


```mermaid
 classDiagram
    class CollateralRounding
    click CollateralRounding href "../CollateralRounding"
      CollateralRounding : currency
        
          
    
        
        
        CollateralRounding --> "1" ISOCurrencyCodeEnum : currency
        click ISOCurrencyCodeEnum href "../ISOCurrencyCodeEnum"
    

        
      CollateralRounding : deliveryAmount
        
      CollateralRounding : deliveryDirection
        
          
    
        
        
        CollateralRounding --> "1" RoundingModeEnum : deliveryDirection
        click RoundingModeEnum href "../RoundingModeEnum"
    

        
      CollateralRounding : other
        
      CollateralRounding : returnAmount
        
      CollateralRounding : returnDirection
        
          
    
        
        
        CollateralRounding --> "1" RoundingModeEnum : returnDirection
        click RoundingModeEnum href "../RoundingModeEnum"
    

        
      
```
