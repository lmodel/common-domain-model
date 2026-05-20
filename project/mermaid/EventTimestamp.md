


```mermaid
 classDiagram
    class EventTimestamp
    click EventTimestamp href "../EventTimestamp"
      EventTimestamp : dateTime
        
      EventTimestamp : qualification
        
          
    
        
        
        EventTimestamp --> "1" EventTimestampQualificationEnum : qualification
        click EventTimestampQualificationEnum href "../EventTimestampQualificationEnum"
    

        
      
```
