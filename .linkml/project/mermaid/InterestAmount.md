


```mermaid
 classDiagram
    class InterestAmount
    click InterestAmount href "../InterestAmount"
      InterestAmount : deliveryAmount
        
          
    
        
        
        InterestAmount --> "1" DeliveryAmount : deliveryAmount
        click DeliveryAmount href "../DeliveryAmount"
    

        
      InterestAmount : returnAmount
        
          
    
        
        
        InterestAmount --> "1" ReturnAmount : returnAmount
        click ReturnAmount href "../ReturnAmount"
    

        
      
```
