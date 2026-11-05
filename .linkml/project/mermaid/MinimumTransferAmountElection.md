


```mermaid
 classDiagram
    class MinimumTransferAmountElection
    click MinimumTransferAmountElection href "../MinimumTransferAmountElection"
      MinimumTransferAmountElection : fixedAmount
        
          
    
        
        
        MinimumTransferAmountElection --> "0..1" ThresholdMinimumTransferAmountFixedAmount : fixedAmount
        click ThresholdMinimumTransferAmountFixedAmount href "../ThresholdMinimumTransferAmountFixedAmount"
    

        
      MinimumTransferAmountElection : other
        
      MinimumTransferAmountElection : party
        
          
    
        
        
        MinimumTransferAmountElection --> "1" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      MinimumTransferAmountElection : ratingsBased
        
          
    
        
        
        MinimumTransferAmountElection --> "0..1" MinimumTransferAmountRatingsBased : ratingsBased
        click MinimumTransferAmountRatingsBased href "../MinimumTransferAmountRatingsBased"
    

        
      
```
