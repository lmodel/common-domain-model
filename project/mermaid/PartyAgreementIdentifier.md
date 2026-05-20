


```mermaid
 classDiagram
    class PartyAgreementIdentifier
    click PartyAgreementIdentifier href "../PartyAgreementIdentifier"
      PartyAgreementIdentifier : documentIdentifier
        
          
    
        
        
        PartyAgreementIdentifier --> "1..*" Identifier : documentIdentifier
        click Identifier href "../Identifier"
    

        
      PartyAgreementIdentifier : partyReference
        
          
    
        
        
        PartyAgreementIdentifier --> "1" Party : partyReference
        click Party href "../Party"
    

        
      
```
