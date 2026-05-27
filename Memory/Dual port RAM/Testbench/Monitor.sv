class monitor;
  
  transaction t;
  
  mailbox m_to_sc;
  
  virtual ram_itf.mon vif;
  
  function new(mailbox m_to_sc,virtual ram_itf.mon vif);
    
    this.m_to_sc=m_to_sc;
    this.vif=vif;
    
  endfunction
  
  task mon();
    begin
      
      forever begin
        
        t=new();
        
    
        @(vif.mon_clk)
        
        t.data_a=vif.mon_clk.data_a;
        t.data_b=vif.mon_clk.data_b;
        t.addr_a=vif.mon_clk.addr_a;
        t.addr_b=vif.mon_clk.addr_b;
        t.w_a=vif.mon_clk.w_a;
        t.w_b=vif.mon_clk.w_b;
        
        
        t.data_out_a=vif.mon_clk.data_out_a;   
        t.data_out_b=vif.mon_clk.data_out_b;
       
        
        m_to_sc.put(t);
        
          $display("");
        
        $display("|.........................................................|");
        $display("| [time=%0t]               MONITOR                        |",$time);
        $display("|.........................................................|");
        $display("|                    :                    :               |");
        $display("|   DATA_A =%3d      :   ADDR_A =%3d      :   W_A=%3b     |",t.data_a,t.addr_a,t.w_a);
        $display("|                    :                    :               |");
        $display("|   DATA_B =%3d      :   ADDR_B =%3d      :   W_B=%3b     |",t.data_b,t.addr_b,t.w_b);
        $display("|                    :                    :               |");
        $display("|.........................................................|"); 
        $display("|      DATA_OUT_A =%3d       :    DATA_OUT_B =%3d         |",t.data_out_a,t.data_out_b);
        $display("|.........................................................|");
          $display("");
        
        
        
      end
    end
  endtask
endclass:monitor
        
    
