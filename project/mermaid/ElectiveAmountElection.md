


```mermaid
 classDiagram
    class ElectiveAmountElection
    click ElectiveAmountElection href "../ElectiveAmountElection"
      ElectiveAmountElection : amount
        
          
    
        
        
        ElectiveAmountElection --> "0..1" Money : amount
        click Money href "../Money"
    

        
      ElectiveAmountElection : customElection
        
      ElectiveAmountElection : electiveAmount
        
          
    
        
        
        ElectiveAmountElection --> "0..1" ElectiveAmountEnum : electiveAmount
        click ElectiveAmountEnum href "../ElectiveAmountEnum"
    

        
      ElectiveAmountElection : party
        
          
    
        
        
        ElectiveAmountElection --> "1" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      
```
