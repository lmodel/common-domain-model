


```mermaid
 classDiagram
    class LegacyExposureScopeElection
    click LegacyExposureScopeElection href "../LegacyExposureScopeElection"
      LegacyExposureScopeElection : additionalLanguage
        
      LegacyExposureScopeElection : excludedProducts
        
          
    
        
        
        LegacyExposureScopeElection --> "*" ExcludedProducts : excludedProducts
        click ExcludedProducts href "../ExcludedProducts"
    

        
      LegacyExposureScopeElection : excludedTransactions
        
      LegacyExposureScopeElection : party
        
          
    
        
        
        LegacyExposureScopeElection --> "1" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      
```
