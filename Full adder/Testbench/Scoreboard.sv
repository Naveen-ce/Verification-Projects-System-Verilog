class scoreboard;
  
  transaction t;
  transaction t1;
  
  mailbox rf_to_sc;
  mailbox m_to_sc;
  
  function new(mailbox rf_to_sc,mailbox m_to_sc);
    
    this.rf_to_sc=rf_to_sc;
    this.m_to_sc=m_to_sc;
    
  endfunction
  
  
  task sc();
    begin
      
      repeat(20) begin
        
        t=new();
        t1=new();
        
        rf_to_sc.get(t);
        m_to_sc.get(t1);
        
        $display("+---------------------------------------------------------+");
        $display("|                                                         |");
        $display("|                     DATA EVALUATION                     |");
        $display("+---------------------------------------------------------+");
        
        $display(" A=%b | B=%b | Cin=%b", t.a, t.b, t.cin);
                 
        $display("Expected Sum=%d | Expected Carry=%d",t.sum,t.carry);
                 
         $display("Actual Sum=%d | Actual Carry=%d",t1.sum,t1.carry);
        
        $display("");
                 
                
        if((t1.sum==t.sum) && (t1.carry==t.carry)) begin
                  
          $display("+---------------------------------------------------------+");
          $display("|                                                         |");
          $display("|                           PASS                          |");
          $display("+---------------------------------------------------------+");
                 
                 
   $display("+---------------------------------------------------------+");
   $display("| Actual Sum | Actual Carry x  Expected Sum |Expected Carry|");
   $display("|            |              x               |              |");
          $display("|    %d       |     %d        x       %d       |     %d        | ",t1.sum,t1.carry,t.sum,t.carry);
   $display("|            |              x               |              |");            
   $display("+-----------------------------------------------------------+");
          $display("");
          $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
          $display("");
          
                 end
                         
               else begin
                 
                 $display("+------------------------------------------------------------+");
                 $display("|                                                            |");
                 $display("|                            FAIL                            |");
                 $display("+------------------------------------------------------------+");
                 
                 
                 $display("+-----------------------------------------------------------+");
                 $display("| Actual Sum | Actual Carry x  Expected Sum |Expected Carry |");
                 $display("|            |              x               |               |"); 
                 $display("|    %d       |     %d        x       %d       |     %d         |",t1.sum,t1.carry,t.sum,t.carry);
                 $display("|            |              x               |               |");             
                 $display("+-----------------------------------------------------------+");
                 $display("");
                 
                 $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
                 $display("");
               end
                         
                         
                         #10;
                         end
                         end
                         endtask
                         endclass:scoreboard
