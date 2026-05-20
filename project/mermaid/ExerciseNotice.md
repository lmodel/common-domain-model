


```mermaid
 classDiagram
    class ExerciseNotice
    click ExerciseNotice href "../ExerciseNotice"
      ExerciseNotice : businessCenter
        
      ExerciseNotice : exerciseNoticeGiver
        
          
    
        
        
        ExerciseNotice --> "1" ExerciseNoticeGiverEnum : exerciseNoticeGiver
        click ExerciseNoticeGiverEnum href "../ExerciseNoticeGiverEnum"
    

        
      ExerciseNotice : exerciseNoticeReceiver
        
          
    
        
        
        ExerciseNotice --> "0..1" AncillaryRoleEnum : exerciseNoticeReceiver
        click AncillaryRoleEnum href "../AncillaryRoleEnum"
    

        
      
```
