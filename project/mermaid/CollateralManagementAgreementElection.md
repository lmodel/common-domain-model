


```mermaid
 classDiagram
    class CollateralManagementAgreementElection
    click CollateralManagementAgreementElection href "../CollateralManagementAgreementElection"
      CollateralManagementAgreementElection : collateralManagementAgreement
        
      CollateralManagementAgreementElection : party
        
          
    
        
        
        CollateralManagementAgreementElection --> "1" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      
```
