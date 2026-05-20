


```mermaid
 classDiagram
    class SinglePostingParty
    click SinglePostingParty href "../SinglePostingParty"
      SinglePostingParty : other
        
      SinglePostingParty : party
        
          
    
        
        
        SinglePostingParty --> "0..1" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      
```
