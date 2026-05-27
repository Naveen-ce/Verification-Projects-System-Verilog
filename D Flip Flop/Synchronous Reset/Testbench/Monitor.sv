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
        
        @(vif.mon_clk)
        
        t.rst=vif.mon_clk.rst;
        t.d=vif.mon_clk.d;
        t.q=vif.mon_clk.q;
       
        m_to_sc.put(t);
        $display("| [Time=%0t] MONITOR -----> RST =%b | D =%b | Q =%b",$time,t.rst,t.d,t.q);
        
      end
    end
  endtask
endclass:monitor
        
    
