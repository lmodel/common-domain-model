


```mermaid
 classDiagram
    class ControlAgreement
    click ControlAgreement href "../ControlAgreement"
      ControlAgreement : partyElection
        
          
    
        
        
        ControlAgreement --> "1..*" ControlAgreementElections : partyElection
        click ControlAgreementElections href "../ControlAgreementElections"
    

        
      
```
