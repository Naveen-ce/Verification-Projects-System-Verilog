module d_ff(dff_itf.dut vif);
  
  always@(posedge vif.clk or posedge vif.rst)begin
    if(vif.rst)
vif.q<=1'b0;
else
vif.q<=vif.d;
end
endmodule
