module full_adder(add_itf vif);
  
  assign vif.sum=vif.a^vif.b^vif.cin;
  assign vif.carry=(vif.a&vif.b)|(vif.a&vif.cin)|(vif.b&vif.cin);
  
endmodule
