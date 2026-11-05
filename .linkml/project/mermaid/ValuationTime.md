


```mermaid
 classDiagram
    class ValuationTime
    click ValuationTime href "../ValuationTime"
      ValuationTime : additionalLanguage
        
      ValuationTime : day
        
          
    
        
        
        ValuationTime --> "0..1" ValuationTimeDayEnum : day
        click ValuationTimeDayEnum href "../ValuationTimeDayEnum"
    

        
      ValuationTime : hourminutetime
        
      ValuationTime : location
        
      ValuationTime : time
        
          
    
        
        
        ValuationTime --> "0..1" ValuationTimeEnum : time
        click ValuationTimeEnum href "../ValuationTimeEnum"
    

        
      ValuationTime : timezone
        
      
```
