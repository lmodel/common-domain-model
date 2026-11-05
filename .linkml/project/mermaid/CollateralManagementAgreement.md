


```mermaid
 classDiagram
    class CollateralManagementAgreement
    click CollateralManagementAgreement href "../CollateralManagementAgreement"
      CollateralManagementAgreement : partyElection
        
          
    
        
        
        CollateralManagementAgreement --> "1..*" CollateralManagementAgreementElection : partyElection
        click CollateralManagementAgreementElection href "../CollateralManagementAgreementElection"
    

        
      
```
