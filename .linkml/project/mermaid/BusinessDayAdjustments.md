


```mermaid
 classDiagram
    class BusinessDayAdjustments
    click BusinessDayAdjustments href "../BusinessDayAdjustments"
      BusinessDayAdjustments : businessCenters
        
          
    
        
        
        BusinessDayAdjustments --> "0..1" BusinessCenters : businessCenters
        click BusinessCenters href "../BusinessCenters"
    

        
      BusinessDayAdjustments : businessDayConvention
        
          
    
        
        
        BusinessDayAdjustments --> "1" BusinessDayConventionEnum : businessDayConvention
        click BusinessDayConventionEnum href "../BusinessDayConventionEnum"
    

        
      
```
