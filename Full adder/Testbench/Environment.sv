`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Reference.sv"
`include "Scoreboard.sv"

class environment;
  
  virtual add_itf.mon vif_mon;
  virtual add_itf.dri vif_dri;
  
  generator g;
  driver d;
  monitor m;
  reference r;
  scoreboard s;
  
  mailbox g_to_dr; //Generator to driver
  mailbox g_to_rf; //Generator to reference
  mailbox m_to_sc; //Monitor to Scoreboard
  mailbox rf_to_sc; //Reference to Scoreboard
  
  event done;
  
  function new( virtual add_itf.mon vif_mon,virtual add_itf.dri vif_dri);
    
    this.vif_dri=vif_dri;
    this.vif_mon=vif_mon;
    
    
    g_to_dr=new();
    g_to_rf=new();
    m_to_sc=new();
    rf_to_sc=new();
    
    g=new(g_to_dr,g_to_rf,done);
    d=new(g_to_dr,done,vif_dri);
    m=new(m_to_sc,vif_mon);
    r=new(g_to_rf,rf_to_sc);
    s=new(rf_to_sc,m_to_sc);
    
  endfunction
      
          
      task run();
        fork
          g.gen();
          d.dr();
          m.mon();
          r.rf();
          s.sc();
        join
      endtask
  
endclass:environment
