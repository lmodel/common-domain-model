


```mermaid
 classDiagram
    class ExcludedProducts
    click ExcludedProducts href "../ExcludedProducts"
      ExcludedProducts : branch
        
      ExcludedProducts : excluded
        
      ExcludedProducts : product
        
          
    
        
        
        ExcludedProducts --> "*" ExposureScopeProductEnum : product
        click ExposureScopeProductEnum href "../ExposureScopeProductEnum"
    

        
      
```
