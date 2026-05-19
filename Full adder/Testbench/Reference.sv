class reference;
  
  transaction t;
  
  mailbox g_to_rf;
  mailbox rf_to_sc;
  
  function new(mailbox g_to_rf,mailbox rf_to_sc);
    
    this.g_to_rf=g_to_rf;
    this.rf_to_sc=rf_to_sc;
    
  endfunction
  
  
  task rf();
    begin
      
      repeat(20) begin
        
   
        g_to_rf.get(t);
        
        t.sum=(t.a^t.b^t.cin);
        t.carry=(t.a&t.b) | (t.a&t.cin) | (t.b&t.cin);
        
        rf_to_sc.put(t);
        
        #10;
        
      end
    end
  endtask
endclass:reference
