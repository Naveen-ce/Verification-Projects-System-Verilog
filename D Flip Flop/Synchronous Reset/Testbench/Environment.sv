`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"

class environment;
  
  virtual dff_itf.mon vif_mon;
  virtual dff_itf.dri vif_dri;
  
  generator g;
  driver d;
  monitor m;
  scoreboard s;
  
  mailbox g_to_dr; //Generator to driver
  mailbox m_to_sc; //Monitor to Scoreboard
  
  event done;
  
  real pr;
  
  function new( virtual dff_itf.mon vif_mon,virtual dff_itf.dri vif_dri);
    
    this.vif_dri=vif_dri;
    this.vif_mon=vif_mon;
    
    
    g_to_dr=new();
    m_to_sc=new();
    
    g=new(g_to_dr,done);
    d=new(g_to_dr,done,vif_dri);
    m=new(m_to_sc,vif_mon);
    s=new(m_to_sc);
    
  endfunction
      
          
      task run();
        fork
          g.gen();
          d.dr();
          m.mon();
          s.sc();
        join_any
        #0;
        disable fork;
        
        
        pr=(s.pass/s.total)*100;
          
          $display("+------------------------------------------------+");
          $display("|        TOTAL NUMBER OF TEST CASES =%2d          |",s.total);
          $display("|------------------------------------------------|");
          $display("|          PASS           |          FAIL        |");
          $display("|                         |                      |");
          $display("|          %3d            |          %3d         |",s.pass,s.fail);
          $display("|                         |                      |");
          $display("|------------------------------------------------|");
          $display("              SUCCESS RATE = %0f                   ",pr);
          $display("|------------------------------------------------|");
          
          #1; 
        
      endtask
  
endclass:environment
