


```mermaid
 classDiagram
    class AncillaryEntity
    click AncillaryEntity href "../AncillaryEntity"
      AncillaryEntity : ancillaryParty
        
          
    
        
        
        AncillaryEntity --> "0..1" AncillaryRoleEnum : ancillaryParty
        click AncillaryRoleEnum href "../AncillaryRoleEnum"
    

        
      AncillaryEntity : legalEntity
        
          
    
        
        
        AncillaryEntity --> "0..1" LegalEntity : legalEntity
        click LegalEntity href "../LegalEntity"
    

        
      
```
