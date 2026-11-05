


```mermaid
 classDiagram
    class EligibleCollateralElection
    click EligibleCollateralElection href "../EligibleCollateralElection"
      PostingObligationsElection <|-- EligibleCollateralElection
        click PostingObligationsElection href "../PostingObligationsElection"
      
      EligibleCollateralElection : additionalLanguage
        
      EligibleCollateralElection : asPermitted
        
      EligibleCollateralElection : eligibleCollateral
        
          
    
        
        
        EligibleCollateralElection --> "*" EligibleCollateralCriteria : eligibleCollateral
        click EligibleCollateralCriteria href "../EligibleCollateralCriteria"
    

        
      EligibleCollateralElection : excludedCollateral
        
      EligibleCollateralElection : otherEligibleSupport
        
      EligibleCollateralElection : party
        
          
    
        
        
        EligibleCollateralElection --> "1" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      
```
