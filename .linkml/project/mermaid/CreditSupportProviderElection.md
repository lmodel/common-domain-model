


```mermaid
 classDiagram
    class CreditSupportProviderElection
    click CreditSupportProviderElection href "../CreditSupportProviderElection"
      CreditSupportProviderElection : bespokeCreditSuppportProvider
        
      CreditSupportProviderElection : creditSupportProvider
        
          
    
        
        
        CreditSupportProviderElection --> "*" LegalEntity : creditSupportProvider
        click LegalEntity href "../LegalEntity"
    

        
      CreditSupportProviderElection : creditSupportProviderTerms
        
          
    
        
        
        CreditSupportProviderElection --> "1" CreditSupportProviderTermsEnum : creditSupportProviderTerms
        click CreditSupportProviderTermsEnum href "../CreditSupportProviderTermsEnum"
    

        
      CreditSupportProviderElection : party
        
          
    
        
        
        CreditSupportProviderElection --> "1" Party : party
        click Party href "../Party"
    

        
      
```
