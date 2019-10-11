%{
  #include <stdint.h>
%}
%INTERFACE <ME>

&command
  : &ME Enable * { if_ME.Turf("W%d:50000:00000001\n", $1); }
  : &ME Disable * { if_ME.Turf("W%d:50000:00000000\n", $1); }
  : &ME SetPoint %f (Celcius) C * {
      float setpoint = $3;
      uint32_t *ui32p = (uint32_t *)&setpoint;
      if_ME.Turf("W%d:50012:%08X\n", $1, *ui32p);
    }
  : &ME Live SetPoints Enable * { if_ME.Turf("W%d:50011:00000001\n", $1); }
  : &ME Live SetPoints Disable * { if_ME.Turf("W%d:50011:00000000\n", $1); }
  ;

&ME <int>
  : Laser TEC    { $0 = 1; }
  : Cell Temp    { $0 = 2; }
;
