


```mermaid
 classDiagram
    class RatingAgencyAmount
    click RatingAgencyAmount href "../RatingAgencyAmount"
      RatingAgencyAmount : amount
        
      RatingAgencyAmount : ratingVariableSet
        
          
    
        
        
        RatingAgencyAmount --> "1..*" CreditNotation : ratingVariableSet
        click CreditNotation href "../CreditNotation"
    

        
      
```
