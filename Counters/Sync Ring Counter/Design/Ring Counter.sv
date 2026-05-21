module ring_counter(
input clk,rst,ori,
output [3:0]count);
reg [3:0]q;
always@(posedge clk)begin
if(rst)
q<=4'b0000;
else if(ori)begin
q[3]<=1'b1;
q[2]<=1'b0;
q[1]<=1'b0;
q[0]<=1'b0;
end
else
q<=({q[0],q[3:1]});
end
assign count=q;
endmodule


