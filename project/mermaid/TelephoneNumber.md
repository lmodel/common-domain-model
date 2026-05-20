


```mermaid
 classDiagram
    class TelephoneNumber
    click TelephoneNumber href "../TelephoneNumber"
      TelephoneNumber : number
        
      TelephoneNumber : telephoneNumberType
        
          
    
        
        
        TelephoneNumber --> "0..1" TelephoneTypeEnum : telephoneNumberType
        click TelephoneTypeEnum href "../TelephoneTypeEnum"
    

        
      
```
