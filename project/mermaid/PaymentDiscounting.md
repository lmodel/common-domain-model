


```mermaid
 classDiagram
    class PaymentDiscounting
    click PaymentDiscounting href "../PaymentDiscounting"
      PaymentDiscounting : discountFactor
        
      PaymentDiscounting : presentValueAmount
        
          
    
        
        
        PaymentDiscounting --> "0..1" Money : presentValueAmount
        click Money href "../Money"
    

        
      
```
