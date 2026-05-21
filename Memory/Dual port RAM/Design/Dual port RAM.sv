module dual(

  input bit [7:0] data_a,data_b,
  input bit[5:0] addr_a,addr_b,
  input bit w_a,w_b,clk,
  output  reg [7:0]q_a,q_b   
);
  reg [7:0] mem[63:0];
  
  always @(posedge clk) begin
    
    if(w_a)
      mem[addr_a]<=data_a;
    else
      q_a<=mem[addr_a];
  end
  
  always @(posedge clk) begin
    if(w_b && !(w_a && addr_a==addr_b)) begin  //PORT1 PRIORITY  
      mem[addr_b]<=data_b;
    end
    else if(!w_b)
      q_b<=mem[addr_b];
  end
  
endmodule 
