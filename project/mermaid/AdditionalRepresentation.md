


```mermaid
 classDiagram
    class AdditionalRepresentation
    click AdditionalRepresentation href "../AdditionalRepresentation"
      AdditionalRepresentation : customElection
        
      AdditionalRepresentation : partyElection
        
          
    
        
        
        AdditionalRepresentation --> "1..*" AdditionalRepresentationElection : partyElection
        click AdditionalRepresentationElection href "../AdditionalRepresentationElection"
    

        
      
```
