


```mermaid
 classDiagram
    class CollateralPortfolio
    click CollateralPortfolio href "../CollateralPortfolio"
      CollateralPortfolio : collateralBalance
        
          
    
        
        
        CollateralPortfolio --> "*" CollateralBalance : collateralBalance
        click CollateralBalance href "../CollateralBalance"
    

        
      CollateralPortfolio : collateralPosition
        
          
    
        
        
        CollateralPortfolio --> "*" CollateralPosition : collateralPosition
        click CollateralPosition href "../CollateralPosition"
    

        
      CollateralPortfolio : legalAgreement
        
          
    
        
        
        CollateralPortfolio --> "0..1" LegalAgreement : legalAgreement
        click LegalAgreement href "../LegalAgreement"
    

        
      CollateralPortfolio : portfolioIdentifier
        
          
    
        
        
        CollateralPortfolio --> "0..1" Identifier : portfolioIdentifier
        click Identifier href "../Identifier"
    

        
      
```
