


```mermaid
 classDiagram
    class SensitivityMethodology
    click SensitivityMethodology href "../SensitivityMethodology"
      SensitivityMethodology : customMethodology
        
      SensitivityMethodology : specifiedMethodology
        
          
    
        
        
        SensitivityMethodology --> "0..1" SensitivitiesEnum : specifiedMethodology
        click SensitivitiesEnum href "../SensitivitiesEnum"
    

        
      
```
