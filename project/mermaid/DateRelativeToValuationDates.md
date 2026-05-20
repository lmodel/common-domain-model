


```mermaid
 classDiagram
    class DateRelativeToValuationDates
    click DateRelativeToValuationDates href "../DateRelativeToValuationDates"
      DateRelativeToValuationDates : valuationDatesReference
        
          
    
        
        
        DateRelativeToValuationDates --> "1..*" PerformanceValuationDates : valuationDatesReference
        click PerformanceValuationDates href "../PerformanceValuationDates"
    

        
      
```
