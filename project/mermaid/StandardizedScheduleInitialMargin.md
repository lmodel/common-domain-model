


```mermaid
 classDiagram
    class StandardizedScheduleInitialMargin
    click StandardizedScheduleInitialMargin href "../StandardizedScheduleInitialMargin"
      StandardizedScheduleInitialMargin : netInitialMargin
        
          
    
        
        
        StandardizedScheduleInitialMargin --> "1" Money : netInitialMargin
        click Money href "../Money"
    

        
      StandardizedScheduleInitialMargin : tradeInfo
        
          
    
        
        
        StandardizedScheduleInitialMargin --> "*" StandardizedScheduleTradeInfo : tradeInfo
        click StandardizedScheduleTradeInfo href "../StandardizedScheduleTradeInfo"
    

        
      
```
