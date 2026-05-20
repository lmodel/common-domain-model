


```mermaid
 classDiagram
    class ReferenceInformation
    click ReferenceInformation href "../ReferenceInformation"
      ReferenceInformation : allGuarantees
        
      ReferenceInformation : noReferenceObligation
        
      ReferenceInformation : referenceEntity
        
          
    
        
        
        ReferenceInformation --> "1" LegalEntity : referenceEntity
        click LegalEntity href "../LegalEntity"
    

        
      ReferenceInformation : referenceObligation
        
          
    
        
        
        ReferenceInformation --> "*" ReferenceObligation : referenceObligation
        click ReferenceObligation href "../ReferenceObligation"
    

        
      ReferenceInformation : referencePolicy
        
      ReferenceInformation : referencePrice
        
          
    
        
        
        ReferenceInformation --> "0..1" Price : referencePrice
        click Price href "../Price"
    

        
      ReferenceInformation : securedList
        
      ReferenceInformation : unknownReferenceObligation
        
      
```
