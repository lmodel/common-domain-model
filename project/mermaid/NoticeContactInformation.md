


```mermaid
 classDiagram
    class NoticeContactInformation
    click NoticeContactInformation href "../NoticeContactInformation"
      ContactInformation <|-- NoticeContactInformation
        click ContactInformation href "../ContactInformation"
      
      NoticeContactInformation : additionalInformation
        
      NoticeContactInformation : address
        
          
    
        
        
        NoticeContactInformation --> "*" Address : address
        click Address href "../Address"
    

        
      NoticeContactInformation : email
        
      NoticeContactInformation : naturalPerson
        
          
    
        
        
        NoticeContactInformation --> "*" NaturalPerson : naturalPerson
        click NaturalPerson href "../NaturalPerson"
    

        
      NoticeContactInformation : telephone
        
          
    
        
        
        NoticeContactInformation --> "*" TelephoneNumber : telephone
        click TelephoneNumber href "../TelephoneNumber"
    

        
      NoticeContactInformation : webPage
        
      
```
