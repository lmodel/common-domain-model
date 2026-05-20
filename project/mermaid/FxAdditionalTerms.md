


```mermaid
 classDiagram
    class FxAdditionalTerms
    click FxAdditionalTerms href "../FxAdditionalTerms"
      FxAdditionalTerms : determinationTerms
        
          
    
        
        
        FxAdditionalTerms --> "0..1" DeterminationRolesAndTerms : determinationTerms
        click DeterminationRolesAndTerms href "../DeterminationRolesAndTerms"
    

        
      FxAdditionalTerms : disruptionEvents
        
          
    
        
        
        FxAdditionalTerms --> "0..1" FxDisruptionEvents : disruptionEvents
        click FxDisruptionEvents href "../FxDisruptionEvents"
    

        
      FxAdditionalTerms : noFaultTermination
        
      
```
