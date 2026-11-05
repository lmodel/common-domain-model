


```mermaid
 classDiagram
    class PriceMateriality
    click PriceMateriality href "../PriceMateriality"
      PriceMateriality : escrowArrangement
        
          
    
        
        
        PriceMateriality --> "0..1" EscrowArrangement : escrowArrangement
        click EscrowArrangement href "../EscrowArrangement"
    

        
      PriceMateriality : fallbackReferencePrice
        
          
    
        
        
        PriceMateriality --> "0..1" SettlementRateOption : fallbackReferencePrice
        click SettlementRateOption href "../SettlementRateOption"
    

        
      PriceMateriality : priceMaterialityIsApplicable
        
      
```
