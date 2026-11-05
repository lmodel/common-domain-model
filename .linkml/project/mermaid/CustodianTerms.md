


```mermaid
 classDiagram
    class CustodianTerms
    click CustodianTerms href "../CustodianTerms"
      CustodianTerms : initialDesignation
        
          
    
        
        
        CustodianTerms --> "0..1" LegalEntity : initialDesignation
        click LegalEntity href "../LegalEntity"
    

        
      CustodianTerms : minimumAssets
        
          
    
        
        
        CustodianTerms --> "0..1" Money : minimumAssets
        click Money href "../Money"
    

        
      CustodianTerms : minimumRating
        
          
    
        
        
        CustodianTerms --> "0..1" CreditNotation : minimumRating
        click CreditNotation href "../CreditNotation"
    

        
      
```
