class monitor;
  
  transaction t;
  
  mailbox m_to_sc;
  
  virtual add_itf.mon vif;
  
  function new(mailbox m_to_sc, virtual add_itf.mon vif);
    
    this.m_to_sc=m_to_sc;
    this.vif=vif;
    
  endfunction
  
  task mon();
    begin
      
      forever begin
        
        t=new();
        
        #9;
        
        t.a=vif.a;
        t.b=vif.b;
        t.cin=vif.cin;
        t.sum=vif.sum;
        t.carry=vif.carry;
        
        m_to_sc.put(t);
        
        $display("|  [Time=%0t] MONITOR -----> A =%b | B =%b | CIN= %b | SUM =%b | CARRY =%b |",$time,t.a,t.b,t.cin,t.sum,t.carry);
         $display("");
        #1;
        
      end
    end
  endtask
endclass:monitor
        
    
