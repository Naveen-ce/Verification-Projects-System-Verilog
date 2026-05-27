class driver;
  
  transaction t;
 
  mailbox g_to_dr;
  
  event done;
  
  virtual dff_itf.dri vif;
  
  function new(mailbox g_to_dr,event done, virtual dff_itf.dri vif);
 
    this.g_to_dr=g_to_dr;
    this.done=done;
    this.vif=vif;
  endfunction
  
  task dr();
    begin
      
      forever begin
         
        g_to_dr.get(t);
        
        @(vif.dri_clk)
       
        
        vif.dri_clk.rst<=t.rst;
        vif.dri_clk.d<=t.d;
        
        $display("| [Time=%0t] DRIVER -----> RST =%b | D =%b |",$time,t.rst,t.d);
       
       
        #10;
        
        ->done;
        
      end
    end
  endtask
endclass:driver
  
  
  
