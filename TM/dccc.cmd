
%INTERFACE <dccc:dccc>

&command
  : Command &on_off_cmd &cmd_on_off *
      { if_dccc.Turf("D%d\n", 2*$2+$3); }
# : &dccc_cmd * { if_dccc.Turf("D%d\n", $1); }
  ;
&on_off_cmd <int>
# : Scroll_Pump { $0 = 0; } # Will be on mains board
  : Exhaust_Vlv { $0 = 4; }
  : Detector TEC  { $0 = 8; }
  : Gas_Vlv_D { $0 = 0; }
  : Forward Enclosure Exhaust Fan { $0 = 12; }
  : Aft Enclosure Exhaust Fan { $0 = 14; }
  : QCLI_Reset { $0 = 34; }
  : Bub_In_Vlv_D { $0 = 36; }
  : Bub_Out_Vlv_D { $0 = 37; }
  ;

&cmd_on_off <int>
  : On { $0 = 0; }
  : Off { $0 = 1; }
  ;
