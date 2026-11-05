


```mermaid
 classDiagram
    class DeliveryAmount
    click DeliveryAmount href "../DeliveryAmount"
      DeliveryAmount : customElection
        
      DeliveryAmount : standardElection
        
          
    
        
        
        DeliveryAmount --> "0..1" DeliveryAmountElectionEnum : standardElection
        click DeliveryAmountElectionEnum href "../DeliveryAmountElectionEnum"
    

        
      
```
