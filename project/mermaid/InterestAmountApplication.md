


```mermaid
 classDiagram
    class InterestAmountApplication
    click InterestAmountApplication href "../InterestAmountApplication"
      InterestAmountApplication : deliveryAmount
        
          
    
        
        
        InterestAmountApplication --> "1" DeliveryAmount : deliveryAmount
        click DeliveryAmount href "../DeliveryAmount"
    

        
      InterestAmountApplication : returnAmount
        
          
    
        
        
        InterestAmountApplication --> "1" ReturnAmount : returnAmount
        click ReturnAmount href "../ReturnAmount"
    

        
      
```
