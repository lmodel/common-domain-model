


```mermaid
 classDiagram
    class TerminationCurrencySelection
    click TerminationCurrencySelection href "../TerminationCurrencySelection"
      TerminationCurrencySelection : bothAffected
        
      TerminationCurrencySelection : fallbackCurrency
        
      TerminationCurrencySelection : partyElection
        
          
    
        
        
        TerminationCurrencySelection --> "*" PartyTerminationCurrencySelection : partyElection
        click PartyTerminationCurrencySelection href "../PartyTerminationCurrencySelection"
    

        
      TerminationCurrencySelection : statedCurrency
        
      
```
