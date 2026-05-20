


```mermaid
 classDiagram
    class TransactionAdditionalTerms
    click TransactionAdditionalTerms href "../TransactionAdditionalTerms"
      TransactionAdditionalTerms : commoditiesAdditionalTerms
        
      TransactionAdditionalTerms : creditAdditionalTerms
        
      TransactionAdditionalTerms : digitalAssetAdditionalTerms
        
      TransactionAdditionalTerms : equityAdditionalTerms
        
          
    
        
        
        TransactionAdditionalTerms --> "0..1" EquityAdditionalTerms : equityAdditionalTerms
        click EquityAdditionalTerms href "../EquityAdditionalTerms"
    

        
      TransactionAdditionalTerms : foreignExchangeAdditionalTerms
        
          
    
        
        
        TransactionAdditionalTerms --> "0..1" FxAdditionalTerms : foreignExchangeAdditionalTerms
        click FxAdditionalTerms href "../FxAdditionalTerms"
    

        
      TransactionAdditionalTerms : interestRateAdditionalTerms
        
      
```
