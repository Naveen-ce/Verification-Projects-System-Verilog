class scoreboard;
  
  transaction t;
 
  mailbox m_to_sc;
  
  function new(mailbox m_to_sc);
    
    this.m_to_sc=m_to_sc;
    
  endfunction
  
  
  bit expected,expected_pr;
  int total,pass,fail;
  
  task sc();
    begin
      
      forever begin
        
        m_to_sc.get(t);
        
        if(t.rst) begin
          expected_pr=1'b0;
          total++;
        end
        
        else begin
          expected_pr=t.d;
          total++;
        end
        
        
        $display("+=========================================================+");
        $display("|                                                         |");
        $display("|                     DATA EVALUATION                     |");
        $display("+=========================================================+");
        
               
        if(t.q==expected) begin
                  
          $display("+---------------------------------------------------------+");
          $display("|                                                         |");
          $display("|                           PASS                          |");
          $display("+---------------------------------------------------------+");
                 
                 
          $display("+---------------------------------------------------------+");
          $display("|      Actual Output         x       Expected Output      |");
          $display("|                            x                            |");
          $display("|            %b               x              %b             |",t.q,expected);
          $display("|                            x                            |");            
          $display("+---------------------------------------------------------+");
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
                 
          $display("+---------------------------------------------------------+");
          $display("|     Actual Output              x     Expected Output  |");
          $display("|                            x                          |");
                 $display("|          %b                    x            %b         | ",t.q,expected);
          $display("|                            x                            |");            
          $display("+---------------------------------------------------------+");
          $display("");
          $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
          $display("");
                 fail++;
               end
                         expected=expected_pr;
                         
                         #10;
                         end
                         end
                         endtask
                         endclass:scoreboard
