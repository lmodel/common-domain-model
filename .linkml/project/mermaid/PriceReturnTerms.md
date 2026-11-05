


```mermaid
 classDiagram
    class PriceReturnTerms
    click PriceReturnTerms href "../PriceReturnTerms"
      PriceReturnTerms : conversionFactor
        
      PriceReturnTerms : performance
        
      PriceReturnTerms : returnType
        
          
    
        
        
        PriceReturnTerms --> "1" ReturnTypeEnum : returnType
        click ReturnTypeEnum href "../ReturnTypeEnum"
    

        
      
```
