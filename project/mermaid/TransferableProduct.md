


```mermaid
 classDiagram
    class TransferableProduct
    click TransferableProduct href "../TransferableProduct"
      Asset <|-- TransferableProduct
        click Asset href "../Asset"
      
      TransferableProduct : economicTerms
        
          
    
        
        
        TransferableProduct --> "1" EconomicTerms : economicTerms
        click EconomicTerms href "../EconomicTerms"
    

        
      
```
