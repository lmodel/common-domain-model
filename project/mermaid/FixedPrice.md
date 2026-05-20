


```mermaid
 classDiagram
    class FixedPrice
    click FixedPrice href "../FixedPrice"
      FixedPrice : price
        
          
    
        
        
        FixedPrice --> "0..1" PriceSchedule : price
        click PriceSchedule href "../PriceSchedule"
    

        
      
```
