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
        join
      endtask
  
endclass:environment
