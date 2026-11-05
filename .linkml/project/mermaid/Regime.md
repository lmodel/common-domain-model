


```mermaid
 classDiagram
    class Regime
    click Regime href "../Regime"
      Regime : applicableRegime
        
          
    
        
        
        Regime --> "1..*" ApplicableRegime : applicableRegime
        click ApplicableRegime href "../ApplicableRegime"
    

        
      Regime : fallbackToMandatoryMethodDays
        
      
```
