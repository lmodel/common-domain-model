


```mermaid
 classDiagram
    class CalculationAndTimingCollateralTransferAgreement
    click CalculationAndTimingCollateralTransferAgreement href "../CalculationAndTimingCollateralTransferAgreement"
      CalculationAndTimingBase <|-- CalculationAndTimingCollateralTransferAgreement
        click CalculationAndTimingBase href "../CalculationAndTimingBase"
      
      CalculationAndTimingCollateralTransferAgreement : bespokeCalculationDate
        
          
    
        
        
        CalculationAndTimingCollateralTransferAgreement --> "0..1" BespokeCalculationDate : bespokeCalculationDate
        click BespokeCalculationDate href "../BespokeCalculationDate"
    

        
      CalculationAndTimingCollateralTransferAgreement : bespokeCalculationTime
        
          
    
        
        
        CalculationAndTimingCollateralTransferAgreement --> "0..1" BespokeCalculationTime : bespokeCalculationTime
        click BespokeCalculationTime href "../BespokeCalculationTime"
    

        
      CalculationAndTimingCollateralTransferAgreement : calculationAgentTerms
        
          
    
        
        
        CalculationAndTimingCollateralTransferAgreement --> "0..1" CalculationAgentTerms : calculationAgentTerms
        click CalculationAgentTerms href "../CalculationAgentTerms"
    

        
      CalculationAndTimingCollateralTransferAgreement : calculationDateLocation
        
          
    
        
        
        CalculationAndTimingCollateralTransferAgreement --> "0..1" ValuationCalculationDateLocation : calculationDateLocation
        click ValuationCalculationDateLocation href "../ValuationCalculationDateLocation"
    

        
      CalculationAndTimingCollateralTransferAgreement : cashSettlementDay
        
      CalculationAndTimingCollateralTransferAgreement : notificationTime
        
          
    
        
        
        CalculationAndTimingCollateralTransferAgreement --> "1" NotificationTime : notificationTime
        click NotificationTime href "../NotificationTime"
    

        
      CalculationAndTimingCollateralTransferAgreement : securitiesSettlementDay
        
      
```
