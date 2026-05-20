


```mermaid
 classDiagram
    class Workflow
    click Workflow href "../Workflow"
      Workflow : steps
        
          
    
        
        
        Workflow --> "1..*" WorkflowStep : steps
        click WorkflowStep href "../WorkflowStep"
    

        
      
```
