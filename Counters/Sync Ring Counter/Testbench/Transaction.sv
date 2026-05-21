class transaction;
  
  rand bit rst;
  rand bit ori;
  
  bit [3:0] q;
  
  constraint c1{rst dist {0:=20,1:=3};}
  constraint c2{ori dist {0:=30,1:=4};}
  
  function void display();
    $display("RESET=%b | ORI=%b",rst,ori);
  endfunction
  
endclass:transaction
