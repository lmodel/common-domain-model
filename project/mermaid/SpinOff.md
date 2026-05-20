


```mermaid
 classDiagram
    class SpinOff
    click SpinOff href "../SpinOff"
      SpinOff : childSecurity
        
          
    
        
        
        SpinOff --> "1" Security : childSecurity
        click Security href "../Security"
    

        
      SpinOff : childSecurityPrice
        
          
    
        
        
        SpinOff --> "1" Price : childSecurityPrice
        click Price href "../Price"
    

        
      SpinOff : parentSecurity
        
          
    
        
        
        SpinOff --> "1" Security : parentSecurity
        click Security href "../Security"
    

        
      SpinOff : parentSecurityPrice
        
          
    
        
        
        SpinOff --> "1" Price : parentSecurityPrice
        click Price href "../Price"
    

        
      
```
