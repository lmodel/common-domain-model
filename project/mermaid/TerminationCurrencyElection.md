


```mermaid
 classDiagram
    class TerminationCurrencyElection
    click TerminationCurrencyElection href "../TerminationCurrencyElection"
      TerminationCurrencyElection : currency
        
      TerminationCurrencyElection : isSpecified
        
      TerminationCurrencyElection : party
        
          
    
        
        
        TerminationCurrencyElection --> "1..*" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      
```
