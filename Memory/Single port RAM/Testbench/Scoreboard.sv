class scoreboard;
  
  transaction t;
 
  mailbox m_to_sc;
  
  function new(mailbox m_to_sc);
    
    this.m_to_sc=m_to_sc;
    
  endfunction
  
 reg[7:0] ram [63:0];
  bit [7:0] expected,expected_pr;
  
 int pass,fail,total;
  
  task sc();
    begin
      
      forever begin
        
        m_to_sc.get(t);
        
         if(t.w_en) begin
          
          ram[t.addr]=t.data_in;
          $display("+|-------------Data Written Successfully ---------------|+");
          total++;
          
	    end
	    else begin
          
          
          expected_pr=ram[t.addr];
          $display("+|-------------Data Read Successfully ---------------|+");
          $display("");
          total++;

        end
        
        
        $display("+=========================================================+");
        $display("|                                                         |");
        $display("|                       SCORE BOARD                       |");
        $display("+=========================================================+");
          
                
        if(t.data_out==expected) begin
          pass++;
                  
          $display("+---------------------------------------------------------+");
          $display("|                                                         |");
          $display("|                          PASS                           |");
          $display("|                                                         |");
          $display("+---------------------------------------------------------+");
                 
                 
          $display("+---------------------------------------------------------+");
          $display("|    Actual Output           x        Expected Output     |");
          $display("|                            x                            |");
          $display("|         %3d                x              %3d           | ",t.data_out,expected);
          $display("|                            x                            |");            
          $display("+---------------------------------------------------------+");
          $display("");
          $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");

          $display("");
          
           end
                         
           else begin
                 fail++;
                 
                 $display("+---------------------------------------------------------+");
                 $display("|                                                         |");
                 $display("|                           FAIL                          |");
                 $display("|                                                         |");
                 $display("+---------------------------------------------------------+");
                 
                 $display("+---------------------------------------------------------+");
                 $display("|      Actual Output         x       Expected Output      |");
                 $display("|                            x                            |");
                 $display("|           %3d              x              %3d           | ",t.data_out,expected);
                 $display("|                            x                            |");            
                 $display("+---------------------------------------------------------+");
             
          $display("");   
          $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
          $display("");
               end
                         
        
        expected=expected_pr;
                         
                         #10;
                         end
                         end
                         endtask
                         endclass:scoreboard
