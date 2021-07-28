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
  : Mains Pump Stop * { CAN->write_ack((1<<8)+0x20, 2); }
  : Mains Pump Start * { CAN->write_ack((1<<8)+0x20, 5); }
  : Mains Pump Speed 0 RPM * { CAN->write_ack((1<<8)+0x20, 2); }
  : Mains Pump Speed 1000 RPM * { CAN->write_ack((1<<8)+0x20, 3); }
  : Mains Pump Speed 1500 RPM * { CAN->write_ack((1<<8)+0x20, 4); }
  : Mains Pump Speed 1250 RPM * { CAN->write_ack((1<<8)+0x20, 5); }
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
  
