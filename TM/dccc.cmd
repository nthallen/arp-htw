
%INTERFACE <dccc:dccc>

&command
  : Command &on_off_cmd &cmd_on_off *
      { if_dccc.Turf("D%d\n", 2*$2+$3); }
# : &dccc_cmd * { if_dccc.Turf("D%d\n", $1); }
  ;
&on_off_cmd <int>
  : Scroll_Pump { $0 = 0; }
  : Cal_Bub1_Vlv { $0 = 1; }
  : Cal_Bub2_Vlv { $0 = 2; }
  : TE_HC1 { $0 = 3; }
  : LPV_HC { $0 = 4; }
  : Cell_HC { $0 = 5; }
  : DPV_HC { $0 = 6; }
  : SpCmd1 { $0 = 7; }
  : SpCmd2 { $0 = 8; }
  : L1Cmd { $0 = 9; }
  : TE_HC2 { $0 = 10; }
# : Gas_Vlv { $0 = 11; }
  : Edw_Vlv { $0 = 12; }
# : Bub_Gas_Vlv { $0 = 13; }
  : Gas_Flw_Open { $0 = 24; }
  : Gas_Flw_Closed { $0 = 25; }
  : Bub_Gas_Flw_Open { $0 = 26; }
  : Bub_Gas_Flw_Closed { $0 = 27; }
  : Cal_Gas_Flw_Open { $0 = 28; }
  : Cal_Gas_Flw_Closed { $0 = 29; }
  : Cal_Bub1_Flw_Open { $0 = 30; }
  : Cal_Bub1_Flw_Closed { $0 = 31; }
  : Cal_Bub2_Flw_Open { $0 = 32; }
  : Cal_Bub2_Flw_Closed { $0 = 33; }
  : QCLI_Reset { $0 = 34; }
  : Gas_Vlv_D { $0 = 35; }
  : Bub_Gas_Vlv_D { $0 = 36; }
  : Bub_Vlv_Flw_D { $0 = 37; }
  ;

&cmd_on_off <int>
  : On { $0 = 0; }
  : Off { $0 = 1; }
  ;
