interface ct_itf(input clk);
  
  logic rst;
  logic ori;
  logic [3:0] q;
  
  clocking dri_clk @(posedge clk);
    default input #1step output #0;
    
    input q;
    output ori;
    
  endclocking
  
  clocking mon_clk @(posedge clk);
    default input #0 output #0;
    
    input ori,q;
    
  endclocking
  
 
  
  modport mon(input clk,rst,ori,q,clocking mon_clk);
    modport dri(input clk,output rst,clocking dri_clk);
  
    
endinterface:ct_itf 
  
