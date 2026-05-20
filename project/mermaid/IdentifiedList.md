


```mermaid
 classDiagram
    class IdentifiedList
    click IdentifiedList href "../IdentifiedList"
      IdentifiedList : componentId
        
          
    
        
        
        IdentifiedList --> "1..*" Identifier : componentId
        click Identifier href "../Identifier"
    

        
      IdentifiedList : listId
        
          
    
        
        
        IdentifiedList --> "1" Identifier : listId
        click Identifier href "../Identifier"
    

        
      IdentifiedList : price
        
          
    
        
        
        IdentifiedList --> "0..1" Price : price
        click Price href "../Price"
    

        
      
```
