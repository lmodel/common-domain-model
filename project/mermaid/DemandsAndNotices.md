


```mermaid
 classDiagram
    class DemandsAndNotices
    click DemandsAndNotices href "../DemandsAndNotices"
      DemandsAndNotices : deemedEffectiveNextLBD
        
      DemandsAndNotices : partyElection
        
          
    
        
        
        DemandsAndNotices --> "1..*" NoticeInformationElection : partyElection
        click NoticeInformationElection href "../NoticeInformationElection"
    

        
      
```
