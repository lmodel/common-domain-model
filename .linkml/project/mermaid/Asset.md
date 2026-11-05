


```mermaid
 classDiagram
    class Asset
    click Asset href "../Asset"
      Asset <|-- SpecificAsset
        click SpecificAsset href "../SpecificAsset"
      Asset <|-- TransferableProduct
        click TransferableProduct href "../TransferableProduct"
      
      
```
