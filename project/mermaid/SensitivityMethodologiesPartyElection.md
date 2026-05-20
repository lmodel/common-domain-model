


```mermaid
 classDiagram
    class SensitivityMethodologiesPartyElection
    click SensitivityMethodologiesPartyElection href "../SensitivityMethodologiesPartyElection"
      SensitivityMethodologiesPartyElection : party
        
          
    
        
        
        SensitivityMethodologiesPartyElection --> "1" CounterpartyRoleEnum : party
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      SensitivityMethodologiesPartyElection : sensitivityToCommodity
        
          
    
        
        
        SensitivityMethodologiesPartyElection --> "1" SensitivityMethodology : sensitivityToCommodity
        click SensitivityMethodology href "../SensitivityMethodology"
    

        
      SensitivityMethodologiesPartyElection : sensitivityToEquity
        
          
    
        
        
        SensitivityMethodologiesPartyElection --> "1" SensitivityToEquity : sensitivityToEquity
        click SensitivityToEquity href "../SensitivityToEquity"
    

        
      
```
