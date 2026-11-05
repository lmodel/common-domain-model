


```mermaid
 classDiagram
    class PartialExercise
    click PartialExercise href "../PartialExercise"
      PartialExercise <|-- MultipleExercise
        click MultipleExercise href "../MultipleExercise"
      
      PartialExercise : integralMultipleAmount
        
      PartialExercise : minimumNotionalAmount
        
      PartialExercise : minimumNumberOfOptions
        
      PartialExercise : notionalReference
        
          
    
        
        
        PartialExercise --> "0..1" Money : notionalReference
        click Money href "../Money"
    

        
      
```
