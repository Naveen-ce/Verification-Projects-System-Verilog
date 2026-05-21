`include "Environment.sv"
`include "Interface.sv"


module tb_top;
  bit clk;
  
  always #5 clk=~clk;
  

  ram_itf intf(clk);

  dual dut (
    .clk(clk),
    .data_a(intf.data_a),
    .data_b(intf.data_b),
    .addr_a(intf.addr_a),
    .addr_b(intf.addr_b),
    .w_a(intf.w_a),
    .w_b(intf.w_b),
    .q_a(intf.data_out_a),
    .q_b(intf.data_out_b)
  );


  environment env;

  initial begin
   
    env = new(intf.mon, intf.dri);

    env.run();

    #350;
    $display("=========================================================================");
    $display("                          SIMULATION COMPLETE                            ");
    $display("=========================================================================");
    $finish;
  end
  
  initial begin
    $dumpfile("ct.vcd");
    $dumpvars(0,tb_top);
  end

endmodule


