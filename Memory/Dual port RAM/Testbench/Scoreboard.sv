class scoreboard;
  
  transaction t;
 
  mailbox m_to_sc;
  
  function new(mailbox m_to_sc);
    
    this.m_to_sc=m_to_sc;
    
  endfunction
  
 reg[7:0] mem [63:0];
  bit [7:0] expected_a,expected_pr_a; 
  bit [7:0] expected_b,expected_pr_b; 
 int pass,fail,total;
  
  task sc();
    begin
      
      forever begin
        
        m_to_sc.get(t);
        
         if(t.w_a) begin
          
          mem[t.addr_a]=t.data_a;
          $display("+-------- Data-1 Written successfully ------------+");
          total++;
        end
        
        else begin
          
        
          expected_pr_a=mem[t.addr_a];
          $display("+-------- Data-1 Read successfully ------------+");
          total++;
          
        end
        
  

        if(t.w_b && !(t.w_a && t.addr_a==t.addr_b)) 
        begin
         
         mem[t.addr_b]=t.data_b;
         $display("+-------- Data-2 Written successfully ------------+");
          total++;
         
        end
        
        else if(!t.w_b) begin
          
          
          expected_pr_b=mem[t.addr_b];
          $display("+-------- Data-2 Read successfully ------------+");
          $display("");
          total++;
          
        end
        
        
        $display("+=========================================================+");
        $display("|                                                         |");
        $display("|                       SCORE BOARD                       |");
        $display("+=========================================================+");
          
                
        if(t.data_out_a==expected_a) begin
          pass++;
                  
          $display("+---------------------------------------------------------+");
          $display("|                                                         |");
          $display("|                       DATA-1 PASS                       |");
          $display("|                                                         |");
          $display("+---------------------------------------------------------+");
                 
                 
          $display("+---------------------------------------------------------+");
          $display("|    Actual Output           x        Expected Output     |");
          $display("|                            x                            |");
          $display("|         %3d                x              %3d           | ",t.data_out_a,expected_a);
          $display("|                            x                            |");            
          $display("+---------------------------------------------------------+");
          $display("");
          $display("");
          
           end
                         
           else begin
                 fail++;
                 
                 $display("+---------------------------------------------------------+");
                 $display("|                                                         |");
                 $display("|                       DATA-1 FAIL                       |");
                 $display("|                                                         |");
                 $display("+---------------------------------------------------------+");
                 
                 $display("+---------------------------------------------------------+");
                 $display("|      Actual Output         x       Expected Output      |");
                 $display("|                            x                            |");
                 $display("|           %3d              x              %3d           | ",t.data_out_a,expected_a);
                 $display("|                            x                            |");            
                 $display("+---------------------------------------------------------+");
             
          $display("");
          
          $display("");
               end
        
        
        
        if(t.data_out_b==expected_b) begin
          pass++;
                  
          $display("+---------------------------------------------------------+");
          $display("|                                                         |");
          $display("|                       DATA-2 PASS                       |");
          $display("|                                                         |");
          $display("+---------------------------------------------------------+");
                 
                 
          $display("+---------------------------------------------------------+");
          $display("|    Actual Output           x        Expected Output     |");
          $display("|                            x                            |");
          $display("|         %3d                x              %3d           | ",t.data_out_b,expected_b);
          $display("|                            x                            |");            
          $display("+---------------------------------------------------------+");
          $display("");
          $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
          $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");

          $display("");
          
           end
                         
           else begin
                 fail++;
                 
                 $display("+---------------------------------------------------------+");
                 $display("|                                                         |");
                 $display("|                       DATA-2 FAIL                       |");
                 $display("|                                                         |");
                 $display("+---------------------------------------------------------+");
                 
                 $display("+---------------------------------------------------------+");
                 $display("|      Actual Output         x       Expected Output      |");
                 $display("|                            x                            |");
                 $display("|            %3d             x              %3d           |",t.data_out_b,expected_b);
                 $display("|                            x                            |");            
                 $display("+---------------------------------------------------------+");
             
          $display("");
          $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
             $display("---------------------xxxxxxxxxxxxxxxxxxxxx-------------------------");
          $display("");
               end
        
        expected_a=expected_pr_a;
        expected_b=expected_pr_b;
                         
                         
                         #10;
                         end
                         end
                         endtask
                         endclass:scoreboard
