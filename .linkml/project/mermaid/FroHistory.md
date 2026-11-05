


```mermaid
 classDiagram
    class FroHistory
    click FroHistory href "../FroHistory"
      FroHistory : endDate
        
      FroHistory : firstDefinedIn
        
          
    
        
        
        FroHistory --> "0..1" ContractualDefinition : firstDefinedIn
        click ContractualDefinition href "../ContractualDefinition"
    

        
      FroHistory : lastUpdatedIn
        
          
    
        
        
        FroHistory --> "0..1" ContractualDefinition : lastUpdatedIn
        click ContractualDefinition href "../ContractualDefinition"
    

        
      FroHistory : startDate
        
      FroHistory : updateDate
        
      
```
