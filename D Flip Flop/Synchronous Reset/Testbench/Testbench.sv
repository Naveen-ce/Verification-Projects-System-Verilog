`include "Environment.sv"
`include "Interface.sv"


module tb_top;
  bit clk;
  
  always #5 clk=~clk;
  

  dff_itf intf(clk);

  d_ff dut (intf.dut);


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


