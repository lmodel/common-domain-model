


```mermaid
 classDiagram
    class PledgeeRepresentativeRider
    click PledgeeRepresentativeRider href "../PledgeeRepresentativeRider"
      PledgeeRepresentativeRider : isApplicable
        
      PledgeeRepresentativeRider : party
        
          
    
        
        
        PledgeeRepresentativeRider --> "0..1" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      PledgeeRepresentativeRider : representativeEndDate
        
          
    
        
        
        PledgeeRepresentativeRider --> "0..1" CustomisableOffset : representativeEndDate
        click CustomisableOffset href "../CustomisableOffset"
    

        
      PledgeeRepresentativeRider : representativeEvent
        
          
    
        
        
        PledgeeRepresentativeRider --> "0..1" ExceptionEnum : representativeEvent
        click ExceptionEnum href "../ExceptionEnum"
    

        
      PledgeeRepresentativeRider : representativeEventTerms
        
      PledgeeRepresentativeRider : representativeTerms
        
      
```
