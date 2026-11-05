


```mermaid
 classDiagram
    class Tx
    click Tx href "../Tx"
      Tx : ctryOfBrnch
        
      Tx : newTx
        
          
    
        
        
        Tx --> "1" New : newTx
        click New href "../New"
    

        
      Tx : pric
        
          
    
        
        
        Tx --> "1" Pric : pric
        click Pric href "../Pric"
    

        
      Tx : qty
        
          
    
        
        
        Tx --> "1" Qty : qty
        click Qty href "../Qty"
    

        
      Tx : tradDt
        
      Tx : tradgCpcty
        
      Tx : tradVn
        
      
```
