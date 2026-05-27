interface dff_itf(input clk);
  
  logic rst;
  logic d;
  logic q;
  
  clocking dri_clk @(posedge clk);
    default input #1step output #0;
    
    input q;
    output rst,d;
    
  endclocking
  
  clocking mon_clk @(posedge clk);
    default input #1step output #0;
    
    input rst,q,d;
    
  endclocking
  
 
  modport dut(input clk,input rst,d,output q);
  modport mon(input clk,clocking mon_clk);
  modport dri(input clk,clocking dri_clk);
  
    
endinterface:dff_itf 
  
