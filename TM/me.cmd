%{
  #include <stdint.h>
%}
%INTERFACE <Me>

&command
  : &meerstetter Enable * { if_Me.Turf("W%d:50000:00000001\n", $1); }
  : &meerstetter Disable * { if_Me.Turf("W%d:50000:00000000\n", $1); }
  : &meerstetter SetPoint %f (Celcius) C * {
      float setpoint = $3;
      uint32_t *ui32p = (uint32_t *)&setpoint;
      if_Me.Turf("W%d:50012:%08X\n", $1, *ui32p);
    }
  : &meerstetter Live SetPoints Enable * { if_Me.Turf("W%d:50011:00000001\n", $1); }
  : &meerstetter Live SetPoints Disable * { if_Me.Turf("W%d:50011:00000000\n", $1); }
  ;

&meerstetter <int>
  : Me Laser TEC { $0 = 1; }
  ;
