


```mermaid
 classDiagram
    class Merger
    click Merger href "../Merger"
      Merger : acquiredSecurity
        
          
    
        
        
        Merger --> "1" Security : acquiredSecurity
        click Security href "../Security"
    

        
      Merger : acquiredSecurityPrice
        
          
    
        
        
        Merger --> "1" Price : acquiredSecurityPrice
        click Price href "../Price"
    

        
      Merger : purchaserSecurity
        
          
    
        
        
        Merger --> "1" Security : purchaserSecurity
        click Security href "../Security"
    

        
      Merger : purchaserSecurityPrice
        
          
    
        
        
        Merger --> "1" Price : purchaserSecurityPrice
        click Price href "../Price"
    

        
      
```
