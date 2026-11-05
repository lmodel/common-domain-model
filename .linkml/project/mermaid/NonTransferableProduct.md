


```mermaid
 classDiagram
    class NonTransferableProduct
    click NonTransferableProduct href "../NonTransferableProduct"
      NonTransferableProduct : economicTerms
        
          
    
        
        
        NonTransferableProduct --> "1" EconomicTerms : economicTerms
        click EconomicTerms href "../EconomicTerms"
    

        
      NonTransferableProduct : identifier
        
          
    
        
        
        NonTransferableProduct --> "*" ProductIdentifier : identifier
        click ProductIdentifier href "../ProductIdentifier"
    

        
      NonTransferableProduct : taxonomy
        
          
    
        
        
        NonTransferableProduct --> "*" ProductTaxonomy : taxonomy
        click ProductTaxonomy href "../ProductTaxonomy"
    

        
      
```
