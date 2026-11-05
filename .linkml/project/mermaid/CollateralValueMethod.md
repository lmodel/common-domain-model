


```mermaid
 classDiagram
    class CollateralValueMethod
    click CollateralValueMethod href "../CollateralValueMethod"
      CollateralValueMethod : additionalLanguage
        
      CollateralValueMethod : cashCollateral
        
          
    
        
        
        CollateralValueMethod --> "0..1" ValueCashEnum : cashCollateral
        click ValueCashEnum href "../ValueCashEnum"
    

        
      CollateralValueMethod : securitiesCollateral
        
          
    
        
        
        CollateralValueMethod --> "0..1" ValueSecuritiesEnum : securitiesCollateral
        click ValueSecuritiesEnum href "../ValueSecuritiesEnum"
    

        
      
```
