


```mermaid
 classDiagram
    class SpecifiedEntity
    click SpecifiedEntity href "../SpecifiedEntity"
      SpecifiedEntity : materialSubsidiaryTerms
        
      SpecifiedEntity : otherSpecifiedEntityTerms
        
      SpecifiedEntity : party
        
          
    
        
        
        SpecifiedEntity --> "1" Party : party
        click Party href "../Party"
    

        
      SpecifiedEntity : specifiedEntity
        
          
    
        
        
        SpecifiedEntity --> "*" LegalEntity : specifiedEntity
        click LegalEntity href "../LegalEntity"
    

        
      SpecifiedEntity : specifiedEntityTerms
        
          
    
        
        
        SpecifiedEntity --> "1" SpecifiedEntityTermsEnum : specifiedEntityTerms
        click SpecifiedEntityTermsEnum href "../SpecifiedEntityTermsEnum"
    

        
      
```
