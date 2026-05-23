class monitor;
  
  transaction t;
  
  mailbox m_to_sc;
  mailbox m_to_rf;
  
  virtual ram_itf.mon vif;
  
  function new(mailbox m_to_sc,mailbox m_to_rf, virtual ram_itf.mon vif);
    
    this.m_to_sc=m_to_sc;
    this.m_to_rf=m_to_rf;
    this.vif=vif;
    
  endfunction
  
  task mon();
    begin
      
      forever begin
        
        t=new();
        
    
        @(vif.mon_clk)
        
        t.data_in=vif.mon_clk.data_in;
        t.addr=vif.mon_clk.addr;
        t.w_en=vif.mon_clk.w_en;
        
        
        t.data_out=vif.mon_clk.data_out;   
       
       
        
        m_to_sc.put(t);
        m_to_rf.put(t);
        
          $display("");
        
        $display("|.........................................................|");
        $display("| [time=%3t]               MONITOR                        |",$time);
        $display("|.........................................................|");
        $display("|                    :                    :               |");
        $display("|   DATA =%3d        :   ADDR =%3d        :  W_EN=%3b     |",t.data_in,t.addr,t.w_en);
        $display("|                    :                    :               |");
        $display("|.........................................................|"); 
        $display("|                        DATA_OUT =%3d                    |",t.data_out);
        $display("|.........................................................|");
          $display("");
        
        
        
      end
    end
  endtask
endclass:monitor
        
    
