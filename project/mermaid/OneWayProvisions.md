


```mermaid
 classDiagram
    class OneWayProvisions
    click OneWayProvisions href "../OneWayProvisions"
      OneWayProvisions : isApplicable
        
      OneWayProvisions : postingParty
        
          
    
        
        
        OneWayProvisions --> "0..1" CounterpartyRoleEnum : postingParty
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      
```
