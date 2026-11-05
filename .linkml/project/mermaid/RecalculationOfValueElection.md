


```mermaid
 classDiagram
    class RecalculationOfValueElection
    click RecalculationOfValueElection href "../RecalculationOfValueElection"
      RecalculationOfValueElection : party
        
          
    
        
        
        RecalculationOfValueElection --> "1" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      RecalculationOfValueElection : recalculationOfValueElection
        
          
    
        
        
        RecalculationOfValueElection --> "1" RecalculationOfValueElectionEnum : recalculationOfValueElection
        click RecalculationOfValueElectionEnum href "../RecalculationOfValueElectionEnum"
    

        
      RecalculationOfValueElection : recalculationOfValueTerms
        
      
```
