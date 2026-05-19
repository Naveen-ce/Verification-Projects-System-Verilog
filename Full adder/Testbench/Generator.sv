`include "Transaction.sv"
class generator;
  
  transaction t;
  transaction t1;
  
  mailbox g_to_dr;
  mailbox g_to_rf;
  
  event done;
  
  function new(mailbox g_to_dr,mailbox g_to_rf,event done);
    
    this.g_to_dr=g_to_dr;
    this.g_to_rf=g_to_rf;
    this.done=done;
    
  endfunction
  
  
  task gen();
    begin
      
      repeat(20) begin
        
        t=new();
        if (!t.randomize()) begin
    $error("GENERATOR: Randomization failed!");
  end
       
        g_to_dr.put(t);
        
        g_to_rf.put(t);
        
        @(done);
        
      end
    end
  endtask
endclass:generator
    
