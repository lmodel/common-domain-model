


```mermaid
 classDiagram
    class BusinessCenters
    click BusinessCenters href "../BusinessCenters"
      BusinessCenters : businessCenter
        
      BusinessCenters : businessCentersReference
        
          
    
        
        
        BusinessCenters --> "0..1" BusinessCenters : businessCentersReference
        click BusinessCenters href "../BusinessCenters"
    

        
      BusinessCenters : commodityBusinessCalendar
        
          
    
        
        
        BusinessCenters --> "*" CommodityBusinessCalendarEnum : commodityBusinessCalendar
        click CommodityBusinessCalendarEnum href "../CommodityBusinessCalendarEnum"
    

        
      
```
