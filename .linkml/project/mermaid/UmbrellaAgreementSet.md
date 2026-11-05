


```mermaid
 classDiagram
    class UmbrellaAgreementSet
    click UmbrellaAgreementSet href "../UmbrellaAgreementSet"
      UmbrellaAgreementSet : additionalLanguage
        
      UmbrellaAgreementSet : agreement
        
          
    
        
        
        UmbrellaAgreementSet --> "1" Agreement : agreement
        click Agreement href "../Agreement"
    

        
      UmbrellaAgreementSet : party
        
          
    
        
        
        UmbrellaAgreementSet --> "1..*" UmbrellaAgreementParty : party
        click UmbrellaAgreementParty href "../UmbrellaAgreementParty"
    

        
      
```
