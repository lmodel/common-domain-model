


```mermaid
 classDiagram
    class GeneralTerms
    click GeneralTerms href "../GeneralTerms"
      GeneralTerms : additionalTerm
        
      GeneralTerms : basketReferenceInformation
        
          
    
        
        
        GeneralTerms --> "0..1" BasketReferenceInformation : basketReferenceInformation
        click BasketReferenceInformation href "../BasketReferenceInformation"
    

        
      GeneralTerms : indexReferenceInformation
        
          
    
        
        
        GeneralTerms --> "0..1" CreditIndex : indexReferenceInformation
        click CreditIndex href "../CreditIndex"
    

        
      GeneralTerms : modifiedEquityDelivery
        
      GeneralTerms : referenceInformation
        
          
    
        
        
        GeneralTerms --> "0..1" ReferenceInformation : referenceInformation
        click ReferenceInformation href "../ReferenceInformation"
    

        
      GeneralTerms : substitution
        
      
```
