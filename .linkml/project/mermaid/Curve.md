


```mermaid
 classDiagram
    class Curve
    click Curve href "../Curve"
      Curve : commodityCurve
        
          
    
        
        
        Curve --> "0..1" CommodityReferencePriceEnum : commodityCurve
        click CommodityReferencePriceEnum href "../CommodityReferencePriceEnum"
    

        
      Curve : interestRateCurve
        
          
    
        
        
        Curve --> "0..1" InterestRateCurve : interestRateCurve
        click InterestRateCurve href "../InterestRateCurve"
    

        
      
```
