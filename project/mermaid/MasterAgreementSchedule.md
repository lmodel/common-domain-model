


```mermaid
 classDiagram
    class MasterAgreementSchedule
    click MasterAgreementSchedule href "../MasterAgreementSchedule"
      MasterAgreementSchedule : clause
        
          
    
        
        
        MasterAgreementSchedule --> "1..*" MasterAgreementClause : clause
        click MasterAgreementClause href "../MasterAgreementClause"
    

        
      
```
