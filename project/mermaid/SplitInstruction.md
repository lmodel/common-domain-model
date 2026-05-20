


```mermaid
 classDiagram
    class SplitInstruction
    click SplitInstruction href "../SplitInstruction"
      SplitInstruction : breakdown
        
          
    
        
        
        SplitInstruction --> "1..*" PrimitiveInstruction : breakdown
        click PrimitiveInstruction href "../PrimitiveInstruction"
    

        
      
```
