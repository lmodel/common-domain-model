


```mermaid
 classDiagram
    class SensitivityToEquity
    click SensitivityToEquity href "../SensitivityToEquity"
      SensitivityToEquity : sensitivityToETFs
        
          
    
        
        
        SensitivityToEquity --> "1" SensitivityMethodology : sensitivityToETFs
        click SensitivityMethodology href "../SensitivityMethodology"
    

        
      SensitivityToEquity : sensitivityToFunds
        
          
    
        
        
        SensitivityToEquity --> "1" SensitivityMethodology : sensitivityToFunds
        click SensitivityMethodology href "../SensitivityMethodology"
    

        
      SensitivityToEquity : sensitivityToIndices
        
          
    
        
        
        SensitivityToEquity --> "1" SensitivityMethodology : sensitivityToIndices
        click SensitivityMethodology href "../SensitivityMethodology"
    

        
      
```
