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
        
        vif.dri_clk.data_in<=t.data_in;
        
        vif.dri_clk.addr<=t.addr;
        
        vif.dri_clk.w_en<=t.w_en;
   
        
        $display("|.........................................................|");
        $display("| [time=%3t]               DRIVER                         |",$time);
        $display("|.........................................................|");
        $display("|                    :                    :               |");
        $display("|   DATA =%3d        :   ADDR =%3d        :   W_EN=%3b    |",t.data_in,t.addr,t.w_en);
        $display("|                    :                    :               |");
        $display("|.........................................................|");   
        
          $display("");
        
        
        
        ->done;
        
      end
    end
  endtask
endclass:driver
  
  
  
