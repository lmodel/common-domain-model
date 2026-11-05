


```mermaid
 classDiagram
    class SecurityProviderRightsEvent
    click SecurityProviderRightsEvent href "../SecurityProviderRightsEvent"
      SecurityProviderRightsEvent : automaticSetOff
        
      SecurityProviderRightsEvent : customElection
        
      SecurityProviderRightsEvent : fullDischarge
        
      SecurityProviderRightsEvent : includeCoolingOffLanguage
        
      SecurityProviderRightsEvent : partyElection
        
          
    
        
        
        SecurityProviderRightsEvent --> "*" SecurityProviderRightsEventElection : partyElection
        click SecurityProviderRightsEventElection href "../SecurityProviderRightsEventElection"
    

        
      
```
