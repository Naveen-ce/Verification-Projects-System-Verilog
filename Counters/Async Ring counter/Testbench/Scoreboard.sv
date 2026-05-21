class scoreboard;
  
  transaction t;
 
  mailbox m_to_sc;
  
  function new(mailbox m_to_sc);
    
    this.m_to_sc=m_to_sc;
    
  endfunction
  
  
  bit [3:0]expected;
  
  task sc();
    begin
      
      forever begin
        
        t=new();
        
        m_to_sc.get(t);
        
        if(t.rst)
          expected=4'b0;
        else if(t.ori)begin
          expected[3]=1'b1;
          expected[2]=1'b0;
          expected[1]=1'b0;
          expected[0]=1'b0;
        end
        else
          expected=({expected[0],expected[3:1]});

        
        
        $display("+---------------------------------------------------------+");
        $display("|                                                         |");
        $display("|                     DATA EVALUATION                     |");
        $display("+---------------------------------------------------------+");
        
         $display(" [Time=%0t] | rst=%b | ORI=%b",$time,t.rst, t.ori);
        $display("");
                 
       
                 
        $display("|-----Actual output-----|");
        $display("|           %b        |",t.q);
        $display("|-----------------------|");
        
        
        $display("|----Expected output----|");
        $display("|           %b        |",expected);
        $display("|-----------------------|");
        
        $display("");
                 
                
        if(t.q==expected) begin
                  
          $display("+---------------------------------------------------------+");
          $display("|                                                         |");
          $display("|                           PASS                          |");
          $display("+---------------------------------------------------------+");
                 
                 
          $display("+---------------------------------------------------------+");
          $display("|     Actual Output          x          Expected Output   |");
          $display("|                            x                            |");
          $display("|         %b               x               %b         | ",t.q,expected);
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
                 $display("|      Actual Output       x       Expected Output |");
          $display("|                            x                            |");
                 $display("|       %b                 x                   %b     | ",t.q,expected);
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
