


```mermaid
 classDiagram
    class ContractDetails
    click ContractDetails href "../ContractDetails"
      ContractDetails : documentation
        
          
    
        
        
        ContractDetails --> "*" LegalAgreement : documentation
        click LegalAgreement href "../LegalAgreement"
    

        
      ContractDetails : governingLaw
        
          
    
        
        
        ContractDetails --> "0..1" GoverningLawEnum : governingLaw
        click GoverningLawEnum href "../GoverningLawEnum"
    

        
      
```
