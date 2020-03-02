%{
  #include "mains.h"

  #ifdef SERVER
    subbuspp *CAN;
    
    void CAN_init() {
      CAN = new subbuspp("CAN");
      CAN->load();
    }
  #endif
%}

&command
  : Mains Pump Enable * { CAN->write_ack((1<<8)+0x20, 0); }
  : Mains Pump Disable * { CAN->write_ack((1<<8)+0x20, 1); }
  : Mains Pump Speed Zero * { CAN->write_ack((1<<8)+0x20, 2); }
  : Mains &BMM_LED &BMM_Off_On * {
      CAN->write_ack((1<<8)+0x20, $2+$3);
    }
  ;
&BMM_LED <int>
  : LED 1 { $0 = 6; }
  : LED 2 { $0 = 8; }
  : LED 3 { $0 = 10; }
  ;
&BMM_Off_On <int>
  : Off { $0 = 1; }
  : On { $0 = 0; }
  ;
  
