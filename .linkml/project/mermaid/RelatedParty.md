


```mermaid
 classDiagram
    class RelatedParty
    click RelatedParty href "../RelatedParty"
      RelatedParty : accountReference
        
          
    
        
        
        RelatedParty --> "0..1" Account : accountReference
        click Account href "../Account"
    

        
      RelatedParty : partyReference
        
          
    
        
        
        RelatedParty --> "1" Party : partyReference
        click Party href "../Party"
    

        
      RelatedParty : role
        
          
    
        
        
        RelatedParty --> "1" PartyRoleEnum : role
        click PartyRoleEnum href "../PartyRoleEnum"
    

        
      
```
