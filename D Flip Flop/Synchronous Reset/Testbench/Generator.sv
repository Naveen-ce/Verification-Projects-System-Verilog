`include "Transaction.sv"
class generator;
  
  transaction t;
  
  mailbox g_to_dr;
  
  event done;
  
  function new(mailbox g_to_dr,event done);
    
    this.g_to_dr=g_to_dr;
    this.done=done;
    
  endfunction
  
  
  task gen();
    begin
      
      forever begin
        
        t=new();
        if (!t.randomize()) begin
    $error("GENERATOR: Randomization failed!");
  end
       
        g_to_dr.put(t);
       
        
        @(done);
        
      end
    end
  endtask
endclass:generator
    
