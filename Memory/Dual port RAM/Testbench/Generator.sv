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
      
      repeat(60) begin
        
        t=new();
        if (!t.randomize()) begin
    $error("GENERATOR: Randomization failed!");
  end
       
        g_to_dr.put(t);
        
        $display("| GENERATOR -----> DATA_A =%d | DATA_B =%d | ADDR_A =%d | ADDR_B =%d | WRITE_ENABLE_A =%b | WRITE_ENABLE_B =%b |",t.data_a,t.data_b,t.addr_a,t.addr_b,t.w_a,t.w_b);
       
        
        @(done);
        
      end
    end
  endtask
endclass:generator
    
