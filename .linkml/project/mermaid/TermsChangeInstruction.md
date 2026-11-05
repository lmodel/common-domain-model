


```mermaid
 classDiagram
    class TermsChangeInstruction
    click TermsChangeInstruction href "../TermsChangeInstruction"
      TermsChangeInstruction : adjustment
        
          
    
        
        
        TermsChangeInstruction --> "0..1" NotionalAdjustmentEnum : adjustment
        click NotionalAdjustmentEnum href "../NotionalAdjustmentEnum"
    

        
      TermsChangeInstruction : ancillaryParty
        
          
    
        
        
        TermsChangeInstruction --> "*" AncillaryParty : ancillaryParty
        click AncillaryParty href "../AncillaryParty"
    

        
      TermsChangeInstruction : product
        
          
    
        
        
        TermsChangeInstruction --> "0..1" NonTransferableProduct : product
        click NonTransferableProduct href "../NonTransferableProduct"
    

        
      
```
