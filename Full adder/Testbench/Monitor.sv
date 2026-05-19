class monitor;
  
  transaction t;
  
  mailbox m_to_sc;
  
  virtual add_itf.mon vif;
  
  function new(mailbox m_to_sc, virtual add_itf.mon vif);
    
    this.m_to_sc=m_to_sc;
    this.vif=vif;
    
  endfunction
  
  task mon();
    begin
      
      repeat (20) begin
        
        t=new();
        
        #9;
        
        t.a=vif.a;
        t.b=vif.b;
        t.cin=vif.cin;
        t.sum=vif.sum;
        t.carry=vif.carry;
        
        m_to_sc.put(t);
        
        #1;
        
      end
    end
  endtask
endclass:monitor
        
    
