


```mermaid
 classDiagram
    class SecuredPartyRightsEvent
    click SecuredPartyRightsEvent href "../SecuredPartyRightsEvent"
      SecuredPartyRightsEvent : earlyTerminationDateOptionalLanguage
        
      SecuredPartyRightsEvent : failureToPayEarlyTermination
        
      SecuredPartyRightsEvent : securedPartyRightsEventElection
        
          
    
        
        
        SecuredPartyRightsEvent --> "*" SecuredPartyRightsEventElection : securedPartyRightsEventElection
        click SecuredPartyRightsEventElection href "../SecuredPartyRightsEventElection"
    

        
      
```
