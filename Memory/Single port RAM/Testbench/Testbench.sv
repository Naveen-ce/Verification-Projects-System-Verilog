`include "Environment.sv"
`include "Interface.sv"


module tb_top;
  bit clk;
  
  always #5 clk=~clk;
  

  ram_itf intf(clk);

  single_port dut (intf.dut);


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


