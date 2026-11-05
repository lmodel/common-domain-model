


```mermaid
 classDiagram
    class ThresholdElection
    click ThresholdElection href "../ThresholdElection"
      ThresholdElection : fixedAmount
        
          
    
        
        
        ThresholdElection --> "0..1" ThresholdMinimumTransferAmountFixedAmount : fixedAmount
        click ThresholdMinimumTransferAmountFixedAmount href "../ThresholdMinimumTransferAmountFixedAmount"
    

        
      ThresholdElection : infinity
        
      ThresholdElection : other
        
      ThresholdElection : party
        
          
    
        
        
        ThresholdElection --> "1" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      ThresholdElection : ratingsBased
        
          
    
        
        
        ThresholdElection --> "0..1" ThresholdRatingsBased : ratingsBased
        click ThresholdRatingsBased href "../ThresholdRatingsBased"
    

        
      
```
