


```mermaid
 classDiagram
    class DistributionAndInterestPayment
    click DistributionAndInterestPayment href "../DistributionAndInterestPayment"
      DistributionAndInterestPayment : interestParameters
        
          
    
        
        
        DistributionAndInterestPayment --> "*" CollateralInterestParameters : interestParameters
        click CollateralInterestParameters href "../CollateralInterestParameters"
    

        
      
```
