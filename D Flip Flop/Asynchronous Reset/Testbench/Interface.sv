interface dff_itf(input clk);
  
  logic rst;
  logic d;
  logic q;
  
  clocking dri_clk @(posedge clk);
    default input #1step output #0;
    
    input q;
    output d;
    
  endclocking
  
  clocking mon_clk @(posedge clk);
    default input #0 output #0;
    
    input q,d;
    
  endclocking
  
 
  
  modport mon(input clk,input rst,q,d,clocking mon_clk);
    modport dri(input clk,output rst,clocking dri_clk);
  
    
endinterface:dff_itf 
  
