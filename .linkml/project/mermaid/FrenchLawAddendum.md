


```mermaid
 classDiagram
    class FrenchLawAddendum
    click FrenchLawAddendum href "../FrenchLawAddendum"
      FrenchLawAddendum : isApplicable
        
      FrenchLawAddendum : partyElection
        
          
    
        
        
        FrenchLawAddendum --> "*" FrenchLawAddendumElection : partyElection
        click FrenchLawAddendumElection href "../FrenchLawAddendumElection"
    

        
      
```
