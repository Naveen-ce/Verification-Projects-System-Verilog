class monitor;
  
  transaction t;
  
  mailbox m_to_sc;
  
  virtual ct_itf.mon vif;
  
  function new(mailbox m_to_sc, virtual ct_itf.mon vif);
    
    this.m_to_sc=m_to_sc;
    this.vif=vif;
    
  endfunction
  
  task mon();
    begin
      
      forever begin
        
        t=new();
        
    
        @(posedge vif.clk or posedge vif.rst);
        
        t.rst=vif.rst;
        t.ori=vif.ori;
        
        #1;
        t.q=vif.q;
       
        
        m_to_sc.put(t);
        $display("[time=%0t] MONITOR: rst=%B |  ori=%b | q=%b ",$time,t.rst,t.ori,t.q);
        
      end
    end
  endtask
endclass:monitor
        
    
