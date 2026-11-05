


```mermaid
 classDiagram
    class RatingMultiplier
    click RatingMultiplier href "../RatingMultiplier"
      RatingMultiplier : exposureMultiplier
        
      RatingMultiplier : ratingVariableSet
        
          
    
        
        
        RatingMultiplier --> "1..*" CreditNotation : ratingVariableSet
        click CreditNotation href "../CreditNotation"
    

        
      
```
