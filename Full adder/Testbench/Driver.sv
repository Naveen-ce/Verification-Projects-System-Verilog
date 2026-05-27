class driver;
  
  transaction t;
 
  mailbox g_to_dr;
  
  event done;
  
  virtual add_itf.dri vif;
  
  function new(mailbox g_to_dr,event done, virtual add_itf.dri vif);
 
    this.g_to_dr=g_to_dr;
    this.done=done;
    this.vif=vif;
  endfunction
  
  task dr();
    begin
      
      forever begin
         
        t=new();
        g_to_dr.get(t);
       
        
        vif.a=t.a;
        vif.b=t.b;
        vif.cin=t.cin;
        
        $display("| [Time=%0t] DRIVER -----> A =%b | B =%b | CIN =%b |",$time,t.a,t.b,t.cin);
        
        
        #10;
        
        ->done;
        
      end
    end
  endtask
endclass:driver
  
  
  
