


```mermaid
 classDiagram
    class FrenchLawAddendumElection
    click FrenchLawAddendumElection href "../FrenchLawAddendumElection"
      FrenchLawAddendumElection : addendumLanguage
        
      FrenchLawAddendumElection : isApplicable
        
      FrenchLawAddendumElection : party
        
          
    
        
        
        FrenchLawAddendumElection --> "1" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      
```
