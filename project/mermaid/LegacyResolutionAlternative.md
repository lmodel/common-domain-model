


```mermaid
 classDiagram
    class LegacyResolutionAlternative
    click LegacyResolutionAlternative href "../LegacyResolutionAlternative"
      LegacyResolutionAlternative : additionalLanguage
        
      LegacyResolutionAlternative : amount
        
          
    
        
        
        LegacyResolutionAlternative --> "0..1" Money : amount
        click Money href "../Money"
    

        
      LegacyResolutionAlternative : resolutionAlternative
        
          
    
        
        
        LegacyResolutionAlternative --> "0..1" LegacyResolutionAlternativeEnum : resolutionAlternative
        click LegacyResolutionAlternativeEnum href "../LegacyResolutionAlternativeEnum"
    

        
      
```
