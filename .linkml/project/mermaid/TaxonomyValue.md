


```mermaid
 classDiagram
    class TaxonomyValue
    click TaxonomyValue href "../TaxonomyValue"
      TaxonomyValue : classification
        
          
    
        
        
        TaxonomyValue --> "*" TaxonomyClassification : classification
        click TaxonomyClassification href "../TaxonomyClassification"
    

        
      TaxonomyValue : name
        
      
```
