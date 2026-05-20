


```mermaid
 classDiagram
    class ResetFrequency
    click ResetFrequency href "../ResetFrequency"
      Frequency <|-- ResetFrequency
        click Frequency href "../Frequency"
      
      ResetFrequency : period
        
          
    
        
        
        ResetFrequency --> "1" PeriodExtendedEnum : period
        click PeriodExtendedEnum href "../PeriodExtendedEnum"
    

        
      ResetFrequency : periodMultiplier
        
      ResetFrequency : weeklyRollConvention
        
          
    
        
        
        ResetFrequency --> "0..1" WeeklyRollConventionEnum : weeklyRollConvention
        click WeeklyRollConventionEnum href "../WeeklyRollConventionEnum"
    

        
      
```
