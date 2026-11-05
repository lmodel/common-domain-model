


```mermaid
 classDiagram
    class TerminationProvision
    click TerminationProvision href "../TerminationProvision"
      TerminationProvision : cancelableProvision
        
          
    
        
        
        TerminationProvision --> "0..1" CancelableProvision : cancelableProvision
        click CancelableProvision href "../CancelableProvision"
    

        
      TerminationProvision : earlyTerminationProvision
        
          
    
        
        
        TerminationProvision --> "0..1" EarlyTerminationProvision : earlyTerminationProvision
        click EarlyTerminationProvision href "../EarlyTerminationProvision"
    

        
      TerminationProvision : evergreenProvision
        
          
    
        
        
        TerminationProvision --> "0..1" EvergreenProvision : evergreenProvision
        click EvergreenProvision href "../EvergreenProvision"
    

        
      TerminationProvision : extendibleProvision
        
          
    
        
        
        TerminationProvision --> "0..1" ExtendibleProvision : extendibleProvision
        click ExtendibleProvision href "../ExtendibleProvision"
    

        
      TerminationProvision : recallProvision
        
          
    
        
        
        TerminationProvision --> "0..1" RecallProvision : recallProvision
        click RecallProvision href "../RecallProvision"
    

        
      
```
