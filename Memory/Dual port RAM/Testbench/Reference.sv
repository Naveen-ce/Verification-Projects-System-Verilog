class reference;
  
  transaction t;
  
  mailbox m_to_rf;
  mailbox rf_to_sc;
  
  function new(mailbox m_to_rf,mailbox rf_to_sc);
    
    this.m_to_rf=m_to_rf;
    this.rf_to_sc=rf_to_sc;
    
  endfunction
  
  reg[7:0] mem [63:0];
  int total;
  
  task rf();
    begin
      forever begin
        
        t=new();
        
        m_to_rf.get(t);
        
        if(t.w_a) begin
          
          mem[t.addr_a]<=t.data_a;
          $display("+-------- Data-1 Written successfully ------------+");
          total++;
        end
        
        else begin
          
        
          t.data_out_a<=mem[t.addr_a];
          $display("+-------- Data-1 Read successfully ------------+");
          total++;
          
        end
        
  

        if(t.w_b && !(t.w_a && t.addr_a==t.addr_b)) 
        begin
         
         mem[t.addr_b]<=t.data_b;
         $display("+-------- Data-2 Written successfully ------------+");
          total++;
         
        end
        
        else if(!t.w_b) begin
          
          
          t.data_out_b<=mem[t.addr_b];
          $display("+-------- Data-2 Read successfully ------------+");
          $display("");
          total++;
          
        end
  
        rf_to_sc.put(t);
        
      end
    end
  endtask
  
endclass:reference
        
