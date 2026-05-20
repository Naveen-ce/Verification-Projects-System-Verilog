class scoreboard;
  
  transaction t;
 
  mailbox m_to_sc;
  
  function new(mailbox m_to_sc);
    
    this.m_to_sc=m_to_sc;
    
  endfunction
  
  
  reg expected;
  
  task sc();
    begin
      
      forever begin
        
        t=new();
        
        m_to_sc.get(t);
        
        if(t.rst)
          expected=1'b0;
        else
          expected=t.d;
        
        
        $display("+---------------------------------------------------------+");
        $display("|                                                         |");
        $display("|                     DATA EVALUATION                     |");
        $display("+---------------------------------------------------------+");
        
        $display(" rst=%b | D=%b", t.rst, t.d);
                 
       
                 
        $display("|-----Actual output-----|");
        $display("|           %b           |",t.q);
        $display("|-----------------------|");
        
        
        $display("|----Expected output----|");
        $display("|           %b           |",expected);
        $display("|-----------------------|");
        
        $display("");
                 
                
        if(t.q==expected) begin
                  
          $display("+---------------------------------------------------------+");
          $display("|                                                         |");
          $display("|                           PASS                          |");
          $display("+---------------------------------------------------------+");
                 
                 
          $display("+---------------------------------------------------------+");
          $display("| Actual Output              x             Expected Output|");
          $display("|                            x                            |");
          $display("|       %b                    x                   %b        | ",t.d,expected);
          $display("|                            x                            |");            
          $display("+---------------------------------------------------------+");
          $display("");
          $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
          $display("");
          
                 end
                         
               else begin
                 
                 $display("+------------------------------------------------------------+");
                 $display("|                                                            |");
                 $display("|                            FAIL                            |");
                 $display("+------------------------------------------------------------+");
                 
                 $display("+---------------------------------------------------------+");
          $display("| Actual Output              x             Expected Output|");
          $display("|                            x                            |");
                 $display("|       %b                    x                   %b        | ",t.d,expected);
          $display("|                            x                            |");            
          $display("+---------------------------------------------------------+");
          $display("");
          $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
          $display("");
               end
                         
                         
                         #10;
                         end
                         end
                         endtask
                         endclass:scoreboard
