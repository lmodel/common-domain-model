


```mermaid
 classDiagram
    class Custodian
    click Custodian href "../Custodian"
      Custodian : partyElection
        
          
    
        
        
        Custodian --> "1..*" CustodianElection : partyElection
        click CustodianElection href "../CustodianElection"
    

        
      
```
