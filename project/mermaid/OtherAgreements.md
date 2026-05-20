


```mermaid
 classDiagram
    class OtherAgreements
    click OtherAgreements href "../OtherAgreements"
      OtherAgreements : japaneseLawCsa
        
          
    
        
        
        OtherAgreements --> "0..1" OtherAgreementTerms : japaneseLawCsa
        click OtherAgreementTerms href "../OtherAgreementTerms"
    

        
      OtherAgreements : otherCSA
        
          
    
        
        
        OtherAgreements --> "0..1" OtherAgreementTerms : otherCSA
        click OtherAgreementTerms href "../OtherAgreementTerms"
    

        
      
```
