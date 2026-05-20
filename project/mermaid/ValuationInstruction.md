


```mermaid
 classDiagram
    class ValuationInstruction
    click ValuationInstruction href "../ValuationInstruction"
      ValuationInstruction : replace
        
      ValuationInstruction : valuation
        
          
    
        
        
        ValuationInstruction --> "1..*" Valuation : valuation
        click Valuation href "../Valuation"
    

        
      
```
