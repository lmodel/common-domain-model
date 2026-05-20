


```mermaid
 classDiagram
    class ConditionsPrecedent
    click ConditionsPrecedent href "../ConditionsPrecedent"
      ConditionsPrecedent : conditionsPrecedentElection
        
          
    
        
        
        ConditionsPrecedent --> "0..1" ExceptionEnum : conditionsPrecedentElection
        click ExceptionEnum href "../ExceptionEnum"
    

        
      ConditionsPrecedent : customProvision
        
      ConditionsPrecedent : specifiedConditionOrAccessCondition
        
          
    
        
        
        ConditionsPrecedent --> "0..1" SpecifiedConditionOrAccessCondition : specifiedConditionOrAccessCondition
        click SpecifiedConditionOrAccessCondition href "../SpecifiedConditionOrAccessCondition"
    

        
      
```
