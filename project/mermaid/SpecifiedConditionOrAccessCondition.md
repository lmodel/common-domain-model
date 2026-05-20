


```mermaid
 classDiagram
    class SpecifiedConditionOrAccessCondition
    click SpecifiedConditionOrAccessCondition href "../SpecifiedConditionOrAccessCondition"
      SpecifiedConditionOrAccessCondition : additionalLanguage
        
      SpecifiedConditionOrAccessCondition : isApplicable
        
      SpecifiedConditionOrAccessCondition : partyElection
        
          
    
        
        
        SpecifiedConditionOrAccessCondition --> "*" SpecifiedOrAccessConditionPartyElection : partyElection
        click SpecifiedOrAccessConditionPartyElection href "../SpecifiedOrAccessConditionPartyElection"
    

        
      
```
