


```mermaid
 classDiagram
    class LegalEntity
    click LegalEntity href "../LegalEntity"
      LegalEntity : entityIdentifier
        
          
    
        
        
        LegalEntity --> "*" EntityIdentifier : entityIdentifier
        click EntityIdentifier href "../EntityIdentifier"
    

        
      LegalEntity : name
        
      
```
