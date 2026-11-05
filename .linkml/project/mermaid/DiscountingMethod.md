


```mermaid
 classDiagram
    class DiscountingMethod
    click DiscountingMethod href "../DiscountingMethod"
      DiscountingMethod : discountingType
        
          
    
        
        
        DiscountingMethod --> "1" DiscountingTypeEnum : discountingType
        click DiscountingTypeEnum href "../DiscountingTypeEnum"
    

        
      DiscountingMethod : discountRate
        
      DiscountingMethod : discountRateDayCountFraction
        
          
    
        
        
        DiscountingMethod --> "0..1" DayCountFractionEnum : discountRateDayCountFraction
        click DayCountFractionEnum href "../DayCountFractionEnum"
    

        
      
```
