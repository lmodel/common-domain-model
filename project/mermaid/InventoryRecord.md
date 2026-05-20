


```mermaid
 classDiagram
    class InventoryRecord
    click InventoryRecord href "../InventoryRecord"
      InventoryRecord <|-- AvailableInventoryRecord
        click AvailableInventoryRecord href "../AvailableInventoryRecord"
      
      InventoryRecord : identifer
        
          
    
        
        
        InventoryRecord --> "1" AssignedIdentifier : identifer
        click AssignedIdentifier href "../AssignedIdentifier"
    

        
      InventoryRecord : security
        
          
    
        
        
        InventoryRecord --> "1" Security : security
        click Security href "../Security"
    

        
      
```
