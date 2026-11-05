


```mermaid
 classDiagram
    class CashflowRepresentation
    click CashflowRepresentation href "../CashflowRepresentation"
      CashflowRepresentation : cashflowsMatchParameters
        
      CashflowRepresentation : paymentCalculationPeriod
        
          
    
        
        
        CashflowRepresentation --> "*" PaymentCalculationPeriod : paymentCalculationPeriod
        click PaymentCalculationPeriod href "../PaymentCalculationPeriod"
    

        
      
```
