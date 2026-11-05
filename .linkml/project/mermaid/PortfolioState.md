


```mermaid
 classDiagram
    class PortfolioState
    click PortfolioState href "../PortfolioState"
      PortfolioState : lineage
        
          
    
        
        
        PortfolioState --> "1" Lineage : lineage
        click Lineage href "../Lineage"
    

        
      PortfolioState : positions
        
          
    
        
        
        PortfolioState --> "*" Position : positions
        click Position href "../Position"
    

        
      
```
