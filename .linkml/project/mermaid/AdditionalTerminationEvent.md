


```mermaid
 classDiagram
    class AdditionalTerminationEvent
    click AdditionalTerminationEvent href "../AdditionalTerminationEvent"
      AdditionalTerminationEvent : applicableParty
        
          
    
        
        
        AdditionalTerminationEvent --> "1..*" CounterpartyRoleEnum : applicableParty
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      AdditionalTerminationEvent : name
        
      
```
