


```mermaid
 classDiagram
    class CollateralAgreementFloatingRate
    click CollateralAgreementFloatingRate href "../CollateralAgreementFloatingRate"
      FloatingRateBase <|-- CollateralAgreementFloatingRate
        click FloatingRateBase href "../FloatingRateBase"
      
      CollateralAgreementFloatingRate : capRateSchedule
        
          
    
        
        
        CollateralAgreementFloatingRate --> "0..1" StrikeSchedule : capRateSchedule
        click StrikeSchedule href "../StrikeSchedule"
    

        
      CollateralAgreementFloatingRate : compressibleSpread
        
      CollateralAgreementFloatingRate : floorRateSchedule
        
          
    
        
        
        CollateralAgreementFloatingRate --> "0..1" StrikeSchedule : floorRateSchedule
        click StrikeSchedule href "../StrikeSchedule"
    

        
      CollateralAgreementFloatingRate : negativeInterest
        
      CollateralAgreementFloatingRate : rateOption
        
          
    
        
        
        CollateralAgreementFloatingRate --> "0..1" InterestRateIndex : rateOption
        click InterestRateIndex href "../InterestRateIndex"
    

        
      CollateralAgreementFloatingRate : spreadSchedule
        
          
    
        
        
        CollateralAgreementFloatingRate --> "0..1" SpreadSchedule : spreadSchedule
        click SpreadSchedule href "../SpreadSchedule"
    

        
      
```
