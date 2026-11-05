


```mermaid
 classDiagram
    class TransferContactInformation
    click TransferContactInformation href "../TransferContactInformation"
      ContactInformation <|-- TransferContactInformation
        click ContactInformation href "../ContactInformation"
      
      TransferContactInformation : account
        
          
    
        
        
        TransferContactInformation --> "*" Account : account
        click Account href "../Account"
    

        
      TransferContactInformation : additionalInformation
        
      TransferContactInformation : address
        
          
    
        
        
        TransferContactInformation --> "*" Address : address
        click Address href "../Address"
    

        
      TransferContactInformation : email
        
      TransferContactInformation : telephone
        
          
    
        
        
        TransferContactInformation --> "*" TelephoneNumber : telephone
        click TelephoneNumber href "../TelephoneNumber"
    

        
      TransferContactInformation : webPage
        
      
```
