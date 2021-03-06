%{
  #include <stdint.h>
  #include "subbus.h"
%}

%INTERFACE <subbus>

&command
  : Fail Light &fon_off * { set_failure($3); }
  ;

&fon_off <int>
  : on { $0 = 1; }
  : off { $0 = 0; }
  : other { $0 = 2; }
  : both { $0 = 3; }
  ;

&gain <uint16_t>
  : %lf ( xx.x ) {
      double val = $1*10 + .5;
      if ( val < 0 ) val = 0.;
      else if ( val > 9999. ) val = 9999.;
      $0 = (uint16_t)val;
    }
  ;

&tvgain <int16_t>
  : %lf ( [-]xx.x ) {
      double val = $1*10 + .5;
      if ( val < -30000. ) val = -30000.;
      else if ( val > 30000. ) val = 30000.;
      $0 = (int16_t)val;
    }
  ;
