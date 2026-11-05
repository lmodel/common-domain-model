


```mermaid
 classDiagram
    class PostingObligations
    click PostingObligations href "../PostingObligations"
      PostingObligations : partyElection
        
          
    
        
        
        PostingObligations --> "1..*" PostingObligationsElection : partyElection
        click PostingObligationsElection href "../PostingObligationsElection"
    

        
      PostingObligations : securityProvider
        
          
    
        
        
        PostingObligations --> "1..*" CounterpartyRoleEnum : securityProvider
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      
```
