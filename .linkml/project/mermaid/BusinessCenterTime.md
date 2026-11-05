


```mermaid
 classDiagram
    class BusinessCenterTime
    click BusinessCenterTime href "../BusinessCenterTime"
      BusinessCenterTime <|-- FloatingRateIndexFixingTime
        click FloatingRateIndexFixingTime href "../FloatingRateIndexFixingTime"
      
      BusinessCenterTime : businessCenter
        
      BusinessCenterTime : hourMinuteTime
        
      
```
