


```mermaid
 classDiagram
    class LegacyIndependentAmount
    click LegacyIndependentAmount href "../LegacyIndependentAmount"
      LegacyIndependentAmount : additionalLanguage
        
      LegacyIndependentAmount : partyElection
        
          
    
        
        
        LegacyIndependentAmount --> "1..*" LegacyIndependentAmountParty : partyElection
        click LegacyIndependentAmountParty href "../LegacyIndependentAmountParty"
    

        
      
```
