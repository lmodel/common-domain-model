


```mermaid
 classDiagram
    class StandardizedSchedule
    click StandardizedSchedule href "../StandardizedSchedule"
      StandardizedSchedule : assetClass
        
          
    
        
        
        StandardizedSchedule --> "1" StandardizedScheduleAssetClassEnum : assetClass
        click StandardizedScheduleAssetClassEnum href "../StandardizedScheduleAssetClassEnum"
    

        
      StandardizedSchedule : durationInYears
        
      StandardizedSchedule : notional
        
      StandardizedSchedule : notionalCurrency
        
      StandardizedSchedule : productClass
        
          
    
        
        
        StandardizedSchedule --> "1" StandardizedScheduleProductClassEnum : productClass
        click StandardizedScheduleProductClassEnum href "../StandardizedScheduleProductClassEnum"
    

        
      
```
