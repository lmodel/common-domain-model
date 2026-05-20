


```mermaid
 classDiagram
    class TransferSettlementTiming
    click TransferSettlementTiming href "../TransferSettlementTiming"
      TransferSettlementTiming : additionalLanguage
        
      TransferSettlementTiming : cashCollateralTransferSettlementTime
        
          
    
        
        
        TransferSettlementTiming --> "0..1" CashCTSTimeEnum : cashCollateralTransferSettlementTime
        click CashCTSTimeEnum href "../CashCTSTimeEnum"
    

        
      TransferSettlementTiming : securititesCollateralTransferSettlementTime
        
          
    
        
        
        TransferSettlementTiming --> "0..1" SecuritiesCTSTimeEnum : securititesCollateralTransferSettlementTime
        click SecuritiesCTSTimeEnum href "../SecuritiesCTSTimeEnum"
    

        
      
```
