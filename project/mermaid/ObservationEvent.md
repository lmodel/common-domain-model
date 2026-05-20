


```mermaid
 classDiagram
    class ObservationEvent
    click ObservationEvent href "../ObservationEvent"
      ObservationEvent : corporateAction
        
          
    
        
        
        ObservationEvent --> "0..1" CorporateAction : corporateAction
        click CorporateAction href "../CorporateAction"
    

        
      ObservationEvent : creditEvent
        
          
    
        
        
        ObservationEvent --> "0..1" CreditEvent : creditEvent
        click CreditEvent href "../CreditEvent"
    

        
      
```
