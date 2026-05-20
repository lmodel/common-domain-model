


```mermaid
 classDiagram
    class MarginCallBase
    click MarginCallBase href "../MarginCallBase"
      MarginCallBase <|-- MarginCallExposure
        click MarginCallExposure href "../MarginCallExposure"
      MarginCallBase <|-- MarginCallIssuance
        click MarginCallIssuance href "../MarginCallIssuance"
      MarginCallBase <|-- MarginCallResponse
        click MarginCallResponse href "../MarginCallResponse"
      
      MarginCallBase : agreementMinimumTransferAmount
        
          
    
        
        
        MarginCallBase --> "0..1" Money : agreementMinimumTransferAmount
        click Money href "../Money"
    

        
      MarginCallBase : agreementRounding
        
          
    
        
        
        MarginCallBase --> "0..1" Money : agreementRounding
        click Money href "../Money"
    

        
      MarginCallBase : agreementThreshold
        
          
    
        
        
        MarginCallBase --> "0..1" Money : agreementThreshold
        click Money href "../Money"
    

        
      MarginCallBase : baseCurrencyExposure
        
          
    
        
        
        MarginCallBase --> "0..1" MarginCallExposure : baseCurrencyExposure
        click MarginCallExposure href "../MarginCallExposure"
    

        
      MarginCallBase : callAgreementType
        
          
    
        
        
        MarginCallBase --> "1" AgreementName : callAgreementType
        click AgreementName href "../AgreementName"
    

        
      MarginCallBase : callIdentifier
        
          
    
        
        
        MarginCallBase --> "0..1" Identifier : callIdentifier
        click Identifier href "../Identifier"
    

        
      MarginCallBase : clearingBroker
        
          
    
        
        
        MarginCallBase --> "0..1" Party : clearingBroker
        click Party href "../Party"
    

        
      MarginCallBase : collateralPortfolio
        
          
    
        
        
        MarginCallBase --> "0..1" CollateralPortfolio : collateralPortfolio
        click CollateralPortfolio href "../CollateralPortfolio"
    

        
      MarginCallBase : independentAmountBalance
        
          
    
        
        
        MarginCallBase --> "0..1" CollateralBalance : independentAmountBalance
        click CollateralBalance href "../CollateralBalance"
    

        
      MarginCallBase : instructionType
        
          
    
        
        
        MarginCallBase --> "1" MarginCallInstructionType : instructionType
        click MarginCallInstructionType href "../MarginCallInstructionType"
    

        
      MarginCallBase : party
        
          
    
        
        
        MarginCallBase --> "*" Party : party
        click Party href "../Party"
    

        
      MarginCallBase : partyRole
        
          
    
        
        
        MarginCallBase --> "*" PartyRole : partyRole
        click PartyRole href "../PartyRole"
    

        
      MarginCallBase : regIMRole
        
          
    
        
        
        MarginCallBase --> "0..1" RegIMRoleEnum : regIMRole
        click RegIMRoleEnum href "../RegIMRoleEnum"
    

        
      MarginCallBase : regMarginType
        
          
    
        
        
        MarginCallBase --> "1" RegMarginTypeEnum : regMarginType
        click RegMarginTypeEnum href "../RegMarginTypeEnum"
    

        
      
```
