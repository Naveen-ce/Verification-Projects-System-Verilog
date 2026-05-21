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
        
    
        @(vif.mon_clk);
        
        t.rst=vif.mon_clk.rst;
        t.ori=vif.mon_clk.ori;
        
        #1;
        t.q=vif.mon_clk.q;
       
        
        m_to_sc.put(t);
        
        $display("[time=%0t] MONITOR: rst=%B |  ori=%b | q=%b ",$time,t.rst,t.ori,t.q);
        
        
      end
    end
  endtask
endclass:monitor
        
    
