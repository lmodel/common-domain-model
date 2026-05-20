


```mermaid
 classDiagram
    class JurisdictionRelatedTerms
    click JurisdictionRelatedTerms href "../JurisdictionRelatedTerms"
      JurisdictionRelatedTerms : belgianLawSecurityAgreement
        
      JurisdictionRelatedTerms : exclusiveJurisdiction
        
      JurisdictionRelatedTerms : frenchLawAddendum
        
          
    
        
        
        JurisdictionRelatedTerms --> "0..1" FrenchLawAddendum : frenchLawAddendum
        click FrenchLawAddendum href "../FrenchLawAddendum"
    

        
      JurisdictionRelatedTerms : japaneseSecuritiesProvisions
        
          
    
        
        
        JurisdictionRelatedTerms --> "0..1" JapaneseSecuritiesProvisions : japaneseSecuritiesProvisions
        click JapaneseSecuritiesProvisions href "../JapaneseSecuritiesProvisions"
    

        
      JurisdictionRelatedTerms : juryWaiver
        
      
```
