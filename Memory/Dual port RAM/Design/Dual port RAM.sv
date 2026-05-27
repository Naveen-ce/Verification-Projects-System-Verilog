module dual( ram_itf.dut vif);
  
  reg [7:0] mem[63:0];
  
  always @(posedge vif.clk) begin
    
    if(vif.w_a)
      mem[vif.addr_a]<=vif.data_a;
    else
      vif.data_out_a<=mem[vif.addr_a];
  end
  
  always @(posedge vif.clk) begin
    if(vif.w_b && !(vif.w_a && vif.addr_a==vif.addr_b)) begin  //PORT1 PRIORITY  
      mem[vif.addr_b]<=vif.data_b;
    end
    else if(!vif.w_b)
      vif.data_out_b<=mem[vif.addr_b];
  end
  
endmodule 
