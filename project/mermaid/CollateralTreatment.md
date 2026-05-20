


```mermaid
 classDiagram
    class CollateralTreatment
    click CollateralTreatment href "../CollateralTreatment"
      CollateralTreatment : concentrationLimit
        
          
    
        
        
        CollateralTreatment --> "*" ConcentrationLimit : concentrationLimit
        click ConcentrationLimit href "../ConcentrationLimit"
    

        
      CollateralTreatment : isIncluded
        
      CollateralTreatment : valuationTreatment
        
          
    
        
        
        CollateralTreatment --> "0..1" CollateralValuationTreatment : valuationTreatment
        click CollateralValuationTreatment href "../CollateralValuationTreatment"
    

        
      
```
