`include "Environment.sv"
`include "Interface.sv"


module tb_top;
  

  add_itf intf();

  full_adder dut (
    .a(intf.a),
    .b(intf.b),
    .cin(intf.cin),
    .sum(intf.sum),
    .carry(intf.carry)
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

endmodule

