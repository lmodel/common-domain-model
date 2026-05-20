


```mermaid
 classDiagram
    class StrategyFeature
    click StrategyFeature href "../StrategyFeature"
      StrategyFeature : calendarSpread
        
          
    
        
        
        StrategyFeature --> "0..1" CalendarSpread : calendarSpread
        click CalendarSpread href "../CalendarSpread"
    

        
      StrategyFeature : strikeSpread
        
          
    
        
        
        StrategyFeature --> "0..1" StrikeSpread : strikeSpread
        click StrikeSpread href "../StrikeSpread"
    

        
      
```
