


```mermaid
 classDiagram
    class CollateralTransferTiming
    click CollateralTransferTiming href "../CollateralTransferTiming"
      CollateralTransferTiming : collateralTransferTimingDefinition
        
          
    
        
        
        CollateralTransferTiming --> "0..1" CollateralTransferTimingDefinition : collateralTransferTimingDefinition
        click CollateralTransferTimingDefinition href "../CollateralTransferTimingDefinition"
    

        
      CollateralTransferTiming : transferSettlementTiming
        
          
    
        
        
        CollateralTransferTiming --> "0..1" TransferSettlementTiming : transferSettlementTiming
        click TransferSettlementTiming href "../TransferSettlementTiming"
    

        
      
```
