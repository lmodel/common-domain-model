


```mermaid
 classDiagram
    class AutomaticEarlyTermination
    click AutomaticEarlyTermination href "../AutomaticEarlyTermination"
      AutomaticEarlyTermination : fallbackAET
        
      AutomaticEarlyTermination : indemnity
        
      AutomaticEarlyTermination : partyElection
        
          
    
        
        
        AutomaticEarlyTermination --> "*" AutomaticEarlyTerminationElection : partyElection
        click AutomaticEarlyTerminationElection href "../AutomaticEarlyTerminationElection"
    

        
      
```
