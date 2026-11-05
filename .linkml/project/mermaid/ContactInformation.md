


```mermaid
 classDiagram
    class ContactInformation
    click ContactInformation href "../ContactInformation"
      ContactInformation <|-- NoticeContactInformation
        click NoticeContactInformation href "../NoticeContactInformation"
      ContactInformation <|-- TransferContactInformation
        click TransferContactInformation href "../TransferContactInformation"
      
      ContactInformation : address
        
          
    
        
        
        ContactInformation --> "*" Address : address
        click Address href "../Address"
    

        
      ContactInformation : email
        
      ContactInformation : telephone
        
          
    
        
        
        ContactInformation --> "*" TelephoneNumber : telephone
        click TelephoneNumber href "../TelephoneNumber"
    

        
      ContactInformation : webPage
        
      
```
