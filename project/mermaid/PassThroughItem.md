


```mermaid
 classDiagram
    class PassThroughItem
    click PassThroughItem href "../PassThroughItem"
      PassThroughItem : passThroughPercentage
        
      PassThroughItem : payerReceiver
        
          
    
        
        
        PassThroughItem --> "1" PayerReceiver : payerReceiver
        click PayerReceiver href "../PayerReceiver"
    

        
      
```
