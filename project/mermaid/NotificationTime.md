


```mermaid
 classDiagram
    class NotificationTime
    click NotificationTime href "../NotificationTime"
      NotificationTime : disputeNotificationReference
        
      NotificationTime : partyElections
        
          
    
        
        
        NotificationTime --> "1..*" NotificationTimeElection : partyElections
        click NotificationTimeElection href "../NotificationTimeElection"
    

        
      NotificationTime : transferTimingProviso
        
      
```
