


```mermaid
 classDiagram
    class Counterparty
    click Counterparty href "../Counterparty"
      Counterparty : partyReference
        
          
    
        
        
        Counterparty --> "1" Party : partyReference
        click Party href "../Party"
    

        
      Counterparty : role
        
          
    
        
        
        Counterparty --> "1" CounterpartyRoleEnum : role
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      
```
