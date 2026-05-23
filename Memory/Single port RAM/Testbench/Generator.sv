`include "Transaction.sv"
class generator;
  
  transaction t;
  
  mailbox g_to_dr;
  
  event done;
  int num_loops;
  
  function new(mailbox g_to_dr,event done,int num_loops);
    
    this.g_to_dr=g_to_dr;
    this.done=done;
    this.num_loops=num_loops;
    
  endfunction
  
  
  task gen();
    begin
      
      repeat(num_loops) begin
        
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
    
