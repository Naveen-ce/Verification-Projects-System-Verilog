class scoreboard;
  
  transaction t;
  transaction t1;
  
  mailbox rf_to_sc;
  mailbox m_to_sc;
  
  int pass,fail;
  
  function new(mailbox rf_to_sc,mailbox m_to_sc);
    
    this.rf_to_sc=rf_to_sc;
    this.m_to_sc=m_to_sc;
    
  endfunction
  
  
  task sc();
    begin
      
      forever begin
        
        t=new();
        t1=new();
        
        rf_to_sc.get(t);
        m_to_sc.get(t1);
        
        $display("+=========================================================+");
        $display("|                                                         |");
        $display("|                     DATA EVALUATION                     |");
        $display("+=========================================================+");
         $display("");         
        
                
        if((t1.sum==t.sum) && (t1.carry==t.carry)) begin
                  
          $display("+---------------------------------------------------------+");
          $display("|                                                         |");
          $display("|                          PASS                           |");
          $display("+---------------------------------------------------------+");
                 
                 
          $display("+----------------------------------------------------------+");
   $display("| Actual Sum | Actual Carry x  Expected Sum |Expected Carry|");
   $display("|            |              x               |              |");
          $display("|    %d       |     %d        x       %d       |     %d        | ",t1.sum,t1.carry,t.sum,t.carry);
   $display("|            |              x               |              |");            
   $display("+-----------------------------------------------------------+");
          $display("");
          $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
          $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
          $display("");
          
          pass++;
          
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
                  $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
                 $display("");
                 fail++;
               end
                         
                         
                         #10;
                         end
                         end
                         endtask
                         endclass:scoreboard
