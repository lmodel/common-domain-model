


```mermaid
 classDiagram
    class Observation
    click Observation href "../Observation"
      Observation : observationIdentifier
        
          
    
        
        
        Observation --> "1" ObservationIdentifier : observationIdentifier
        click ObservationIdentifier href "../ObservationIdentifier"
    

        
      Observation : observedValue
        
          
    
        
        
        Observation --> "1" Price : observedValue
        click Price href "../Price"
    

        
      
```
