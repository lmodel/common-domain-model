


```mermaid
 classDiagram
    class HoldingAndUsingPostedCollateral
    click HoldingAndUsingPostedCollateral href "../HoldingAndUsingPostedCollateral"
      HoldingAndUsingPostedCollateral : additionalLanguage
        
      HoldingAndUsingPostedCollateral : partyElection
        
          
    
        
        
        HoldingAndUsingPostedCollateral --> "1..*" HoldingAndUsingPostedCollateralElection : partyElection
        click HoldingAndUsingPostedCollateralElection href "../HoldingAndUsingPostedCollateralElection"
    

        
      
```
