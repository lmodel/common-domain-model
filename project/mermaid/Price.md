


```mermaid
 classDiagram
    class Price
    click Price href "../Price"
      PriceSchedule <|-- Price
        click PriceSchedule href "../PriceSchedule"
      
      Price : arithmeticOperator
        
          
    
        
        
        Price --> "0..1" ArithmeticOperationEnum : arithmeticOperator
        click ArithmeticOperationEnum href "../ArithmeticOperationEnum"
    

        
      Price : composite
        
          
    
        
        
        Price --> "0..1" PriceComposite : composite
        click PriceComposite href "../PriceComposite"
    

        
      Price : datedValue
        
          
    
        
        
        Price --> "*" DatedValue : datedValue
        click DatedValue href "../DatedValue"
    

        
      Price : perUnitOf
        
          
    
        
        
        Price --> "0..1" UnitType : perUnitOf
        click UnitType href "../UnitType"
    

        
      Price : premiumType
        
          
    
        
        
        Price --> "0..1" PremiumTypeEnum : premiumType
        click PremiumTypeEnum href "../PremiumTypeEnum"
    

        
      Price : priceExpression
        
          
    
        
        
        Price --> "0..1" PriceExpressionEnum : priceExpression
        click PriceExpressionEnum href "../PriceExpressionEnum"
    

        
      Price : priceSubType
        
          
    
        
        
        Price --> "0..1" PriceSubTypeEnum : priceSubType
        click PriceSubTypeEnum href "../PriceSubTypeEnum"
    

        
      Price : priceType
        
          
    
        
        
        Price --> "1" PriceTypeEnum : priceType
        click PriceTypeEnum href "../PriceTypeEnum"
    

        
      Price : unit
        
          
    
        
        
        Price --> "0..1" UnitType : unit
        click UnitType href "../UnitType"
    

        
      Price : value
        
      
```
