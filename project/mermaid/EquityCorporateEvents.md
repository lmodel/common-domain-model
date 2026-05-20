


```mermaid
 classDiagram
    class EquityCorporateEvents
    click EquityCorporateEvents href "../EquityCorporateEvents"
      EquityCorporateEvents : shareForCombined
        
          
    
        
        
        EquityCorporateEvents --> "1" ShareExtraordinaryEventEnum : shareForCombined
        click ShareExtraordinaryEventEnum href "../ShareExtraordinaryEventEnum"
    

        
      EquityCorporateEvents : shareForOther
        
          
    
        
        
        EquityCorporateEvents --> "1" ShareExtraordinaryEventEnum : shareForOther
        click ShareExtraordinaryEventEnum href "../ShareExtraordinaryEventEnum"
    

        
      EquityCorporateEvents : shareForShare
        
          
    
        
        
        EquityCorporateEvents --> "1" ShareExtraordinaryEventEnum : shareForShare
        click ShareExtraordinaryEventEnum href "../ShareExtraordinaryEventEnum"
    

        
      
```
