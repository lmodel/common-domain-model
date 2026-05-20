


```mermaid
 classDiagram
    class CustodianEvent
    click CustodianEvent href "../CustodianEvent"
      CustodianEvent : endDate
        
          
    
        
        
        CustodianEvent --> "0..1" CustodianEventEndDate : endDate
        click CustodianEventEndDate href "../CustodianEventEndDate"
    

        
      CustodianEvent : isApplicable
        
      
```
