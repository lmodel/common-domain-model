


```mermaid
 classDiagram
    class NaturalPersonRole
    click NaturalPersonRole href "../NaturalPersonRole"
      NaturalPersonRole : personReference
        
          
    
        
        
        NaturalPersonRole --> "1" NaturalPerson : personReference
        click NaturalPerson href "../NaturalPerson"
    

        
      NaturalPersonRole : role
        
          
    
        
        
        NaturalPersonRole --> "*" NaturalPersonRoleEnum : role
        click NaturalPersonRoleEnum href "../NaturalPersonRoleEnum"
    

        
      
```
