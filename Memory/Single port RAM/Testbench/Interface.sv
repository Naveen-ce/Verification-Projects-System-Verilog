interface ram_itf(input clk);
  
  logic [7:0] data_in;
  logic [5:0] addr;
  
  logic w_en;
  
  logic [7:0] data_out;

  
  clocking dri_clk @(posedge clk);
    default input #1ns output #0;
    
    input data_out;
    output data_in,addr,w_en;
    
  endclocking
  
  clocking mon_clk @(posedge clk);
    default input #0 output #0;
    
    input data_in,addr,w_en,data_out;
    
  endclocking
  
 
  
  modport mon(input clk,clocking mon_clk);
  modport dri(input clk,clocking dri_clk);
  
    
endinterface:ram_itf 
  
