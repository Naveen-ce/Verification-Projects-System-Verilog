class driver;
  
  transaction t;
 
  mailbox g_to_dr;
  
  event done;
  
  virtual ram_itf.dri vif;
  
  function new(mailbox g_to_dr,event done, virtual ram_itf.dri vif);
 
    this.g_to_dr=g_to_dr;
    this.done=done;
    this.vif=vif;
  endfunction
  
  task dr();
    begin
      
      forever begin
         
        t=new();
        g_to_dr.get(t);
        
        @(vif.dri_clk)
        
        vif.dri_clk.data_a<=t.data_a;
        
        vif.dri_clk.data_b<=t.data_b;
        
        vif.dri_clk.addr_a<=t.addr_a;
        
        vif.dri_clk.addr_b<=t.addr_b;
        
        vif.dri_clk.w_a<=t.w_a;
        
        vif.dri_clk.w_b<=t.w_b;
        
        $display("|.........................................................|");
        $display("| [time=%0t]               DRIVER                         |",$time);
        $display("|.........................................................|");
        $display("|                    :                    :               |");
        $display("|   DATA_A =%3d      :   ADDR_A =%3d      :   W_A=%3b     |",t.data_a,t.addr_a,t.w_a);
        $display("|                    :                    :               |");
        $display("|   DATA_B =%3d      :   ADDR_B =%3d      :   W_B=%3b     |",t.data_b,t.addr_b,t.w_b);
        $display("|                    :                    :               |");
        $display("|.........................................................|");   
        
          $display("");
        
        
        
        ->done;
        
      end
    end
  endtask
endclass:driver
  
  
  
