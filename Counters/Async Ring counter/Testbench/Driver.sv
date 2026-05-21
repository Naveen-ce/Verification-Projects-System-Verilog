class driver;
  
  transaction t;
 
  mailbox g_to_dr;
  
  event done;
  
  virtual ct_itf.dri vif;
  
  function new(mailbox g_to_dr,event done, virtual ct_itf.dri vif);
 
    this.g_to_dr=g_to_dr;
    this.done=done;
    this.vif=vif;
  endfunction
  
  task dr();
    begin
      
      forever begin
         
        t=new();
        g_to_dr.get(t);
        
         vif.rst=t.rst;
        
        vif.dri_clk.ori<=t.ori;
        
        @(vif.dri_clk)
       
       
        $display("[time=%0t] DRIVER: rst=%b | ori=%b",$time, t.rst,t.ori);
        
        #2;
        
        ->done;
        
      end
    end
  endtask
endclass:driver
  
  
  
