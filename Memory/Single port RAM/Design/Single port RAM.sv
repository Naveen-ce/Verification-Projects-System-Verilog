module single_port
  (ram_itf.dut vif);

  reg [7:0] ram[63:0];

  always@(posedge vif.clk) begin
  if(vif.w_en) begin
    ram[vif.addr]<=vif.data_in;
	end
	else
      vif.data_out<=ram[vif.addr];
end
endmodule
