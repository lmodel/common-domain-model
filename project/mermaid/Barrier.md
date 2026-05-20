


```mermaid
 classDiagram
    class Barrier
    click Barrier href "../Barrier"
      Barrier : knockIn
        
          
    
        
        
        Barrier --> "*" TriggerEvent : knockIn
        click TriggerEvent href "../TriggerEvent"
    

        
      Barrier : knockOut
        
          
    
        
        
        Barrier --> "*" TriggerEvent : knockOut
        click TriggerEvent href "../TriggerEvent"
    

        
      
```
