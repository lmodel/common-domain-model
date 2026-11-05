


```mermaid
 classDiagram
    class CreditNotations
    click CreditNotations href "../CreditNotations"
      CreditNotations : creditNotation
        
          
    
        
        
        CreditNotations --> "0..1" CreditNotation : creditNotation
        click CreditNotation href "../CreditNotation"
    

        
      CreditNotations : creditNotations
        
          
    
        
        
        CreditNotations --> "0..1" MultipleCreditNotations : creditNotations
        click MultipleCreditNotations href "../MultipleCreditNotations"
    

        
      
```
