interface ram_itf(input clk);
  
  logic [7:0] data_a;
  logic [7:0] data_b;
  logic [5:0] addr_a;
  logic [5:0] addr_b;
  
  logic w_a,w_b;
  
  logic [7:0] data_out_a;
  logic [7:0] data_out_b;
  
  clocking dri_clk @(posedge clk);
    default input #1step output #0;
    
    input data_out_a,data_out_b;
    output data_a,data_b,addr_a,addr_b,w_a,w_b;
    
  endclocking
  
  clocking mon_clk @(posedge clk);
    default input #0 output #0;
    
    input data_a,data_b,addr_a,addr_b,w_a,w_b,data_out_a,data_out_b;
    
  endclocking
  
 
  
  modport mon(input clk,clocking mon_clk);
  modport dri(input clk,clocking dri_clk);
  
    
endinterface:ram_itf 
  
