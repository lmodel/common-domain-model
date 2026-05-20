


```mermaid
 classDiagram
    class Collateral
    click Collateral href "../Collateral"
      Collateral : collateralPortfolio
        
          
    
        
        
        Collateral --> "*" CollateralPortfolio : collateralPortfolio
        click CollateralPortfolio href "../CollateralPortfolio"
    

        
      Collateral : collateralProvisions
        
          
    
        
        
        Collateral --> "0..1" CollateralProvisions : collateralProvisions
        click CollateralProvisions href "../CollateralProvisions"
    

        
      Collateral : independentAmount
        
          
    
        
        
        Collateral --> "0..1" IndependentAmount : independentAmount
        click IndependentAmount href "../IndependentAmount"
    

        
      Collateral : portfolioIdentifier
        
          
    
        
        
        Collateral --> "*" Identifier : portfolioIdentifier
        click Identifier href "../Identifier"
    

        
      
```
