


```mermaid
 classDiagram
    class MultipleValuationDates
    click MultipleValuationDates href "../MultipleValuationDates"
      SingleValuationDate <|-- MultipleValuationDates
        click SingleValuationDate href "../SingleValuationDate"
      
      MultipleValuationDates : businessDays
        
      MultipleValuationDates : businessDaysThereafter
        
      MultipleValuationDates : numberValuationDates
        
      
```
