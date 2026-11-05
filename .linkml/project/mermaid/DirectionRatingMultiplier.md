


```mermaid
 classDiagram
    class DirectionRatingMultiplier
    click DirectionRatingMultiplier href "../DirectionRatingMultiplier"
      DirectionRatingMultiplier : exposureMultiplier
        
      DirectionRatingMultiplier : variableSet
        
          
    
        
        
        DirectionRatingMultiplier --> "1..*" DirectionRatingSet : variableSet
        click DirectionRatingSet href "../DirectionRatingSet"
    

        
      
```
