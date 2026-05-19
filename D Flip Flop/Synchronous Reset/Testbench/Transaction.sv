class transaction;
  
  rand bit rst;
  rand bit d;
  
  bit q;
  
  function void display();
    $display("RESET=%b | D=%b",rst,d);
  endfunction
  
endclass:transaction
