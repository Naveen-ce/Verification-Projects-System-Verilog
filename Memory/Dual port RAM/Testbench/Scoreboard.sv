class scoreboard;
  
  transaction t;
  transaction t1;
 
  mailbox m_to_sc;
  mailbox rf_to_sc;
  
  function new(mailbox m_to_sc,mailbox rf_to_sc);
    
    this.m_to_sc=m_to_sc;
    this.rf_to_sc=rf_to_sc;
    
  endfunction
  
  
 int pass,fail;
  
  task sc();
    begin
      
      forever begin
        
        t=new();
        t1=new();
        
        m_to_sc.get(t);
        rf_to_sc.get(t1);
        
        
        $display("+---------------------------------------------------------+");
        $display("|                                                         |");
        $display("|                       SCORE BOARD                       |");
        $display("+---------------------------------------------------------+");
          
                
        if(t.data_out_a==t1.data_out_a) begin
          pass++;
                  
          $display("+---------------------------------------------------------+");
          $display("|                                                         |");
          $display("|                       DATA-1 PASS                       |");
          $display("|                                                         |");
          $display("+---------------------------------------------------------+");
                 
                 
          $display("+---------------------------------------------------------+");
          $display("|    Actual Output           x        Expected Output     |");
          $display("|                            x                            |");
          $display("|         %3d                x              %3d           | ",t.data_out_a,t1.data_out_a);
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
                 $display("|           %3d              x              %3d           | ",t.data_out_a,t1.data_out_a);
                 $display("|                            x                            |");            
                 $display("+---------------------------------------------------------+");
             
          $display("");
          
          $display("");
               end
        
        
        
        if(t.data_out_b==t1.data_out_b) begin
          pass++;
                  
          $display("+---------------------------------------------------------+");
          $display("|                                                         |");
          $display("|                       DATA-2 PASS                       |");
          $display("|                                                         |");
          $display("+---------------------------------------------------------+");
                 
                 
          $display("+---------------------------------------------------------+");
          $display("|    Actual Output           x        Expected Output     |");
          $display("|                            x                            |");
          $display("|         %3d                x              %3d           | ",t.data_out_b,t1.data_out_b);
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
                 $display("|                       DATA-2 FAIL                       |");
                 $display("|                                                         |");
                 $display("+---------------------------------------------------------+");
                 
                 $display("+---------------------------------------------------------+");
                 $display("|      Actual Output         x       Expected Output      |");
                 $display("|                            x                            |");
                 $display("|            %3d             x              %3d           |",t.data_out_b,t1.data_out_b);
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
