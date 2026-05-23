class reference;
  
  transaction t;
  
  mailbox m_to_rf;
  mailbox rf_to_sc;
  
  function new(mailbox m_to_rf,mailbox rf_to_sc);
    
    this.m_to_rf=m_to_rf;
    this.rf_to_sc=rf_to_sc;
    
  endfunction
  
  reg[7:0] ram [63:0];
  int total;
  
  task rf();
    begin
      forever begin
        
        t=new();
        
        m_to_rf.get(t);
        
        if(t.w_en) begin
          
          ram[t.addr]<=t.data_in;
          $display("+-------------Data Written Successfully ---------------+");
          total++;
          
	    end
	    else begin
          
          
          t.data_out<=ram[t.addr];
          $display("+-------------Data Read Successfully ---------------+");
          $display("");
          total++;

        end
        
        
        rf_to_sc.put(t);
        
      end
    end
  endtask
  
endclass:reference
        
