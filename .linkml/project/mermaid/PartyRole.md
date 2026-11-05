


```mermaid
 classDiagram
    class PartyRole
    click PartyRole href "../PartyRole"
      PartyRole : ownershipPartyReference
        
          
    
        
        
        PartyRole --> "0..1" Party : ownershipPartyReference
        click Party href "../Party"
    

        
      PartyRole : partyReference
        
          
    
        
        
        PartyRole --> "1" Party : partyReference
        click Party href "../Party"
    

        
      PartyRole : role
        
          
    
        
        
        PartyRole --> "1" PartyRoleEnum : role
        click PartyRoleEnum href "../PartyRoleEnum"
    

        
      
```
