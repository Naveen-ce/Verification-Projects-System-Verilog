class monitor;
  
  transaction t;
  
  mailbox m_to_sc;
  
  virtual dff_itf.mon vif;
  
  function new(mailbox m_to_sc, virtual dff_itf.mon vif);
    
    this.m_to_sc=m_to_sc;
    this.vif=vif;
    
  endfunction
  
  task mon();
    begin
      
      forever begin
        
        t=new();
        
        
        
        @(posedge vif.clk or posedge vif.rst);
        
        t.rst=vif.rst;
        t.d=vif.d;
        
        #1;
        t.q=vif.q;
       
        
        m_to_sc.put(t);
        
      end
    end
  endtask
endclass:monitor
        
    
