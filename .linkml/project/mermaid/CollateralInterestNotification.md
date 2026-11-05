


```mermaid
 classDiagram
    class CollateralInterestNotification
    click CollateralInterestNotification href "../CollateralInterestNotification"
      CollateralInterestNotification : notificationDayType
        
          
    
        
        
        CollateralInterestNotification --> "1" DayTypeEnum : notificationDayType
        click DayTypeEnum href "../DayTypeEnum"
    

        
      CollateralInterestNotification : notificationTime
        
      CollateralInterestNotification : offset
        
      CollateralInterestNotification : trigger
        
      
```
