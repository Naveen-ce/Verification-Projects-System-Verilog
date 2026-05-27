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
       
        vif.dri_clk.d<=t.d;
        
        $display("| [Time=%0t] DRIVER -----> | D =%b |",$time,t.d);
        #5;
        
        ->done;
        
      end
    end
  endtask
  
  task reset();

   forever 
     begin
      #($urandom_range(10,40));
        vif.rst=1;
      #($urandom_range(2,8));
        vif.rst=0;
   end
endtask
  
  
  task run();

   fork
      reset();
      dr();
   join
  endtask
  
endclass:driver
  
  
  
