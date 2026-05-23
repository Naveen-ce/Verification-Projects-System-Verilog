module single_port
  (input clk,w_en,
 input [5:0] addr,
 input [7:0] data_in,
 output reg [7:0] data_out);

  reg [7:0] ram[63:0];

always@(posedge clk) begin
  if(w_en) begin
		ram[addr]<=data_in;
	end
	else
		data_out<=ram[addr];
end
endmodule
