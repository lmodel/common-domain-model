


```mermaid
 classDiagram
    class ProcessAgent
    click ProcessAgent href "../ProcessAgent"
      ProcessAgent : partyElection
        
          
    
        
        
        ProcessAgent --> "1..*" ProcessAgentElection : partyElection
        click ProcessAgentElection href "../ProcessAgentElection"
    

        
      
```
