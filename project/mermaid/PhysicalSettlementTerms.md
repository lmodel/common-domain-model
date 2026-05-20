


```mermaid
 classDiagram
    class PhysicalSettlementTerms
    click PhysicalSettlementTerms href "../PhysicalSettlementTerms"
      PhysicalSettlementTerms : clearedPhysicalSettlement
        
      PhysicalSettlementTerms : deliverableObligations
        
          
    
        
        
        PhysicalSettlementTerms --> "0..1" DeliverableObligations : deliverableObligations
        click DeliverableObligations href "../DeliverableObligations"
    

        
      PhysicalSettlementTerms : escrow
        
      PhysicalSettlementTerms : physicalSettlementPeriod
        
          
    
        
        
        PhysicalSettlementTerms --> "0..1" PhysicalSettlementPeriod : physicalSettlementPeriod
        click PhysicalSettlementPeriod href "../PhysicalSettlementPeriod"
    

        
      PhysicalSettlementTerms : predeterminedClearingOrganizationParty
        
          
    
        
        
        PhysicalSettlementTerms --> "0..1" AncillaryRoleEnum : predeterminedClearingOrganizationParty
        click AncillaryRoleEnum href "../AncillaryRoleEnum"
    

        
      PhysicalSettlementTerms : sixtyBusinessDaySettlementCap
        
      
```
