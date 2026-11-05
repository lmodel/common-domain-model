


```mermaid
 classDiagram
    class LoanParticipation
    click LoanParticipation href "../LoanParticipation"
      PCDeliverableObligationCharac <|-- LoanParticipation
        click PCDeliverableObligationCharac href "../PCDeliverableObligationCharac"
      
      LoanParticipation : applicable
        
      LoanParticipation : partialCashSettlement
        
      LoanParticipation : qualifyingParticipationSeller
        
      
```
