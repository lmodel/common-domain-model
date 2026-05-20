


```mermaid
 classDiagram
    class NotificationTimeElection
    click NotificationTimeElection href "../NotificationTimeElection"
      NotificationTimeElection : customNotification
        
      NotificationTimeElection : localBusinessDay
        
      NotificationTimeElection : notificationTime
        
          
    
        
        
        NotificationTimeElection --> "0..1" BusinessCenterTime : notificationTime
        click BusinessCenterTime href "../BusinessCenterTime"
    

        
      NotificationTimeElection : party
        
          
    
        
        
        NotificationTimeElection --> "1" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      
```
