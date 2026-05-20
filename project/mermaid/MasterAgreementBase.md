


```mermaid
 classDiagram
    class MasterAgreementBase
    click MasterAgreementBase href "../MasterAgreementBase"
      MasterAgreementBase <|-- GlobalMasterRepoAgreement
        click GlobalMasterRepoAgreement href "../GlobalMasterRepoAgreement"
      MasterAgreementBase <|-- MasterAgreement
        click MasterAgreement href "../MasterAgreement"
      MasterAgreementBase <|-- GlobalMasterSecuritiesLendingAgreement
        click GlobalMasterSecuritiesLendingAgreement href "../GlobalMasterSecuritiesLendingAgreement"
      
      
```
