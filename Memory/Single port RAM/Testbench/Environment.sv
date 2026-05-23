`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"
`include "Reference.sv"

class environment;
  
  virtual ram_itf.mon vif_mon;
  virtual ram_itf.dri vif_dri;
  
  generator g;
  driver d;
  monitor m;
  reference r;
  scoreboard s;
  
  
  mailbox g_to_dr; //Generator to driver
  mailbox m_to_rf; //Generator to reference
  mailbox m_to_sc; //Monitor to Scoreboard
  mailbox rf_to_sc; //Reference to Scoreboard
  
  event done;
  
  real pr;
  
  function new( virtual ram_itf.mon vif_mon,virtual ram_itf.dri vif_dri);
    
    this.vif_dri=vif_dri;
    this.vif_mon=vif_mon;
    
    
    g_to_dr=new();
    m_to_rf=new();
    m_to_sc=new();
    rf_to_sc=new();
    
    g=new(g_to_dr,done,60);
    d=new(g_to_dr,done,vif_dri);
    m=new(m_to_sc,m_to_rf,vif_mon);
    r=new(m_to_rf,rf_to_sc);
    s=new(m_to_sc,rf_to_sc);
    
  endfunction
      
          
      task run();
        fork
          g.gen();
          d.dr();
          m.mon();
          r.rf();
          s.sc();
        join_any 
        #0;
        disable fork;
          
          pr=(s.pass/r.total)*100;
          
          $display("+------------------------------------------------+");
          $display("|        TOTAL NUMBER OF TEST CASES =%2d          |",r.total);
          $display("|------------------------------------------------|");
          $display("|          PASS           |          FAIL        |");
          $display("|                         |                      |");
          $display("|          %3d            |          %3d         |",s.pass,s.fail);
          $display("|                         |                      |");
          $display("|------------------------------------------------|");
          $display("              SUCCESS RATE = %0f                   ",pr);
          $display("|------------------------------------------------|");
          
          #1; 
          
          $finish;
      endtask
    
          
          
endclass:environment
