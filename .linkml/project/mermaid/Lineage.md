


```mermaid
 classDiagram
    class Lineage
    click Lineage href "../Lineage"
      Lineage : eventReference
        
          
    
        
        
        Lineage --> "*" WorkflowStep : eventReference
        click WorkflowStep href "../WorkflowStep"
    

        
      Lineage : portfolioStateReference
        
          
    
        
        
        Lineage --> "*" PortfolioState : portfolioStateReference
        click PortfolioState href "../PortfolioState"
    

        
      Lineage : tradeReference
        
          
    
        
        
        Lineage --> "*" Trade : tradeReference
        click Trade href "../Trade"
    

        
      
```
