


```mermaid
 classDiagram
    class EquityAdditionalTerms
    click EquityAdditionalTerms href "../EquityAdditionalTerms"
      EquityAdditionalTerms : determinationTerms
        
          
    
        
        
        EquityAdditionalTerms --> "1..*" DeterminationRolesAndTerms : determinationTerms
        click DeterminationRolesAndTerms href "../DeterminationRolesAndTerms"
    

        
      EquityAdditionalTerms : extraordinaryEvents
        
          
    
        
        
        EquityAdditionalTerms --> "0..1" ExtraordinaryEvents : extraordinaryEvents
        click ExtraordinaryEvents href "../ExtraordinaryEvents"
    

        
      EquityAdditionalTerms : substitutionProvision
        
          
    
        
        
        EquityAdditionalTerms --> "0..1" UnderlierSubstitutionProvision : substitutionProvision
        click UnderlierSubstitutionProvision href "../UnderlierSubstitutionProvision"
    

        
      
```
