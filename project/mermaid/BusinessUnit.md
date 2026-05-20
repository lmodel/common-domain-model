


```mermaid
 classDiagram
    class BusinessUnit
    click BusinessUnit href "../BusinessUnit"
      BusinessUnit : contactInformation
        
          
    
        
        
        BusinessUnit --> "0..1" ContactInformation : contactInformation
        click ContactInformation href "../ContactInformation"
    

        
      BusinessUnit : identifier
        
          
    
        
        
        BusinessUnit --> "0..1" Identifier : identifier
        click Identifier href "../Identifier"
    

        
      BusinessUnit : name
        
      
```
