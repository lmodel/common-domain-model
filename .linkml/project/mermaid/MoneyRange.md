


```mermaid
 classDiagram
    class MoneyRange
    click MoneyRange href "../MoneyRange"
      MoneyRange : lowerBound
        
          
    
        
        
        MoneyRange --> "0..1" MoneyBound : lowerBound
        click MoneyBound href "../MoneyBound"
    

        
      MoneyRange : upperBound
        
          
    
        
        
        MoneyRange --> "0..1" MoneyBound : upperBound
        click MoneyBound href "../MoneyBound"
    

        
      
```
