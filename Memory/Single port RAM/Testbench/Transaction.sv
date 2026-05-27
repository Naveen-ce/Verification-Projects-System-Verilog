class transaction;
  
  rand bit [7:0] data_in;
  rand bit [5:0] addr;
  
  rand bit w_en;
  
  bit [7:0] data_out;
  
  
  constraint c1{
    addr inside {[0:10]};
               }
  
  constraint c3{ w_en dist{[0:1]:/10};
                if (w_en==0)data_in==0;
               }
 
  
endclass:transaction
