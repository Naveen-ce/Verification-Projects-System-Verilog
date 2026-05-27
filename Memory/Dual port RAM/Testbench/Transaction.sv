class transaction;
  
  rand bit [7:0] data_a;
  rand bit [7:0] data_b;
  rand bit [5:0] addr_a;
  rand bit [5:0] addr_b;
  
  rand bit w_a;
  rand bit w_b;
  
  bit [7:0] data_out_a;
  bit [7:0] data_out_b;
  
  
  constraint c1{ 
                 addr_a!=addr_b;
               }
  
  constraint c2{ addr_a inside {[0:10]};
                addr_b inside {[11:20]};
                 if(w_a==0) data_a==0;
                 if(w_b==0) data_b==0;
               }
  
  constraint c3{ w_a dist{1:=15,0:=15};
                 w_b dist{1:=15,0:=15};
               }
  
  
endclass:transaction
