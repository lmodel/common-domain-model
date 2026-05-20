


```mermaid
 classDiagram
    class HoldingAndUsingPostedCollateralElection
    click HoldingAndUsingPostedCollateralElection href "../HoldingAndUsingPostedCollateralElection"
      HoldingAndUsingPostedCollateralElection : eligibilityToHoldCollateral
        
          
    
        
        
        HoldingAndUsingPostedCollateralElection --> "1" EligibilityToHoldCollateral : eligibilityToHoldCollateral
        click EligibilityToHoldCollateral href "../EligibilityToHoldCollateral"
    

        
      HoldingAndUsingPostedCollateralElection : party
        
          
    
        
        
        HoldingAndUsingPostedCollateralElection --> "1" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      HoldingAndUsingPostedCollateralElection : useOfPostedCollateral
        
      
```
