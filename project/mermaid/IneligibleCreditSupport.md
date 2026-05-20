


```mermaid
 classDiagram
    class IneligibleCreditSupport
    click IneligibleCreditSupport href "../IneligibleCreditSupport"
      IneligibleCreditSupport : specifiedParty
        
          
    
        
        
        IneligibleCreditSupport --> "*" CounterpartyRoleEnum : specifiedParty
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      IneligibleCreditSupport : totalIneligibilityDate
        
      IneligibleCreditSupport : transferIneligibilityDate
        
      
```
