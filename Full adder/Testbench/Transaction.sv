class transaction;
  
  rand bit a;
  rand bit b;
  rand bit cin;
  
  bit sum;
  bit carry;
  
  function void display();
    $display("A=%b | B=%b | Cin=%b",a,b,cin);
  endfunction
  
endclass:transaction
