


```mermaid
 classDiagram
    class NaturalPerson
    click NaturalPerson href "../NaturalPerson"
      NaturalPerson : contactInformation
        
          
    
        
        
        NaturalPerson --> "0..1" ContactInformation : contactInformation
        click ContactInformation href "../ContactInformation"
    

        
      NaturalPerson : dateOfBirth
        
      NaturalPerson : firstName
        
      NaturalPerson : honorific
        
      NaturalPerson : initial
        
      NaturalPerson : middleName
        
      NaturalPerson : personId
        
          
    
        
        
        NaturalPerson --> "*" PersonIdentifier : personId
        click PersonIdentifier href "../PersonIdentifier"
    

        
      NaturalPerson : suffix
        
      NaturalPerson : surname
        
      
```
