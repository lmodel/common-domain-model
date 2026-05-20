


```mermaid
 classDiagram
    class FloatingRateIndexFixingTime
    click FloatingRateIndexFixingTime href "../FloatingRateIndexFixingTime"
      BusinessCenterTime <|-- FloatingRateIndexFixingTime
        click BusinessCenterTime href "../BusinessCenterTime"
      
      FloatingRateIndexFixingTime : businessCenter
        
      FloatingRateIndexFixingTime : designatedMaturity
        
      FloatingRateIndexFixingTime : fixingReason
        
      FloatingRateIndexFixingTime : fixingTimeDefinition
        
      FloatingRateIndexFixingTime : hourMinuteTime
        
      
```
