


```mermaid
 classDiagram
    class BuyerSeller
    click BuyerSeller href "../BuyerSeller"
      BuyerSeller <|-- CancelableProvision
        click CancelableProvision href "../CancelableProvision"
      BuyerSeller <|-- ExtendibleProvision
        click ExtendibleProvision href "../ExtendibleProvision"
      
      BuyerSeller : buyer
        
          
    
        
        
        BuyerSeller --> "1" CounterpartyRoleEnum : buyer
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      BuyerSeller : seller
        
          
    
        
        
        BuyerSeller --> "1" CounterpartyRoleEnum : seller
        click CounterpartyRoleEnum href "../CounterpartyRoleEnum"
    

        
      
```
