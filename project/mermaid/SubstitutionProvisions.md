


```mermaid
 classDiagram
    class SubstitutionProvisions
    click SubstitutionProvisions href "../SubstitutionProvisions"
      SubstitutionProvisions : noticeDeadlineDateTime
        
      SubstitutionProvisions : noticeDeadlinePeriod
        
          
    
        
        
        SubstitutionProvisions --> "0..1" Period : noticeDeadlinePeriod
        click Period href "../Period"
    

        
      SubstitutionProvisions : numberOfSubstitutionsAllowed
        
      
```
