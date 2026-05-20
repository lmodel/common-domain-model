


```mermaid
 classDiagram
    class EligibleCreditSupport
    click EligibleCreditSupport href "../EligibleCreditSupport"
      EligibleCreditSupport : partyElection
        
          
    
        
        
        EligibleCreditSupport --> "1..*" EligibleCollateralElection : partyElection
        click EligibleCollateralElection href "../EligibleCollateralElection"
    

        
      
```
