


```mermaid
 classDiagram
    class EventCurrency
    click EventCurrency href "../EventCurrency"
      EventCurrency : eventCurrency
        
      EventCurrency : eventCurrencyBuyerSeller
        
          
    
        
        
        EventCurrency --> "*" BuyerSeller : eventCurrencyBuyerSeller
        click BuyerSeller href "../BuyerSeller"
    

        
      EventCurrency : eventCurrentAmount
        
          
    
        
        
        EventCurrency --> "0..1" Quantity : eventCurrentAmount
        click Quantity href "../Quantity"
    

        
      
```
