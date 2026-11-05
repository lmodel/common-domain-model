


```mermaid
 classDiagram
    class EligibilityToHoldCollateral
    click EligibilityToHoldCollateral href "../EligibilityToHoldCollateral"
      EligibilityToHoldCollateral : criteria
        
          
    
        
        
        EligibilityToHoldCollateral --> "0..1" EligibilityToHoldCollateralCriteria : criteria
        click EligibilityToHoldCollateralCriteria href "../EligibilityToHoldCollateralCriteria"
    

        
      EligibilityToHoldCollateral : custodianCondition
        
      EligibilityToHoldCollateral : custodianEligibility
        
      EligibilityToHoldCollateral : eligibleCountry
        
      EligibilityToHoldCollateral : initialCustodian
        
          
    
        
        
        EligibilityToHoldCollateral --> "0..1" LegalEntity : initialCustodian
        click LegalEntity href "../LegalEntity"
    

        
      
```
