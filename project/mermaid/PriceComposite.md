


```mermaid
 classDiagram
    class PriceComposite
    click PriceComposite href "../PriceComposite"
      PriceComposite : arithmeticOperator
        
          
    
        
        
        PriceComposite --> "1" ArithmeticOperationEnum : arithmeticOperator
        click ArithmeticOperationEnum href "../ArithmeticOperationEnum"
    

        
      PriceComposite : baseValue
        
      PriceComposite : operand
        
      PriceComposite : operandType
        
          
    
        
        
        PriceComposite --> "0..1" PriceOperandEnum : operandType
        click PriceOperandEnum href "../PriceOperandEnum"
    

        
      
```
