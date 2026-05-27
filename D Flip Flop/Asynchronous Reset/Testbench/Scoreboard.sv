class scoreboard;
  
  transaction t;
 
  mailbox m_to_sc;
  
  function new(mailbox m_to_sc);
    
    this.m_to_sc=m_to_sc;
    
  endfunction
  
  
  bit expected;
  int total,pass,fail;
  
  task sc();
    begin
      
      forever begin
        
        t=new();
        
        m_to_sc.get(t);
        
        if(t.rst) begin
          expected=1'b0;
          total++;
        end
        
        else begin
          expected=t.d;
          total++;
        end
        
        
        $display("+=========================================================+");
        $display("|                                                         |");
        $display("|                     DATA EVALUATION                     |");
        $display("+=========================================================+");
       
        $display("");
                 
                
        if(t.q==expected) begin
                  
          $display("+---------------------------------------------------------+");
          $display("|                                                         |");
          $display("|                           PASS                          |");
          $display("+---------------------------------------------------------+");
                 
                 
          $display("+---------------------------------------------------------+");
          $display("|   Actual Output            x         Expected Output    |");
          $display("|                            x                            |");
          $display("|        %b                   x               %b            | ",t.q,expected);
          $display("|                            x                            |");            
          $display("+---------------------------------------------------------+");
          $display("");
          $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
          $display("");
          pass++;
          
                 end
                         
               else begin
                 
                 $display("+------------------------------------------------------------+");
                 $display("|                                                            |");
                 $display("|                            FAIL                            |");
                 $display("+------------------------------------------------------------+");
                 
                 $display("+---------------------------------------------------------+");
                 $display("|   Actual Output            x         Expected Output   |");
                 $display("|                            x                            |");
                 $display("|       %b                    x                  %b         | ",t.q,expected);
          $display("|                            x                            |");            
          $display("+---------------------------------------------------------+");
          $display("");
          $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
          $display("");
                 fail++;
               end
                         
                      
        
                         
                         end
                         end
                         endtask
                         endclass:scoreboard
