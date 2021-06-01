%{
  #include "SWData.h"
  #ifdef SERVER
    SWData_t SWData;
  #endif
%}

%INTERFACE <SWData:DG/data>

&command
  : &SWTM * { if_SWData.Turf(); }
  ;
&SWTM
  : SW Status &SW_St { SWData.SW_St = $3; }
  : Set Cell Pressure Setpoint &Cell_SetP { SWData.Cell_SetP = $5; }
  : Set Cell Pressure Gain Gi &PV_Gi { SWData.PV_Gi = $6; }
  : Set Cell Pressure Gain Gp &PV_Gp { SWData.PV_Gp = $6; }
  : Set GasDeck Pressure Gain Gi &GD_Gi { SWData.GD_Gi = $6; }
  : Set GasDeck Pressure Gain Gp &GD_Gp { SWData.GD_Gp = $6; }
  : Set Inlet DP Setpoint &TV_DP_Set { SWData.TV_DP_Set = $5; }
  : Set Inlet DP Gain Gi &TV_Gi { SWData.TV_Gi = $6; }
  : Set Inlet DP Gain Gp &TV_Gp { SWData.TV_Gp = $6; }
  ;
&SW_St <unsigned char>
  : Altitude Takeoff { $0 = SWS_TAKEOFF; }
  : Set %d { $0 = $2; }
  : Altitude Climb { $0 = SWS_CLIMB; }
  : Altitude Descend { $0 = SWS_DESCEND; }
  : Altitude Land { $0 = SWS_LAND; }
  : Laser Start { $0 = SWS_LASER_START; }
  : Laser Stop { $0 = SWS_LASER_STOP; }
  : Laser Select Waveform and Start { $0 = SWS_LASER_WAVE; }
  : Calibrate Start { $0 = SWS_CALIBRATE_START; }
  : Calibrate Stop { $0 = SWS_CALIBRATE_STOP; }
  : Flow Zero { $0 = SWS_FLOW_ZERO; }
  : Pinch Valve PI { $0 = SWS_PV_PI; }
  : Pinch Valve Scan { $0 = SWS_PV_SCAN; }
  : Throttle Valve PI Init { $0 = SWS_TV_INIT; }
  : Throttle Valve Close { $0 = SWS_TV_CLOSE; }
  : Throttle Valve Scan { $0 = SWS_TV_SCAN; }
  : Gas Deck PI Init { $0 = SWS_GD_PI; }
  : Gas Deck Fill Cell { $0 = SWS_GD_FILL; }
  : Gas Deck Pump Purge { $0 = SWS_GD_PUMP_PURGE; }
  : Pump Simulate Over Temp { $0 = SWS_PUMP_OVER_TEMP; }
  : Pump Clear Simulated Over Temp { $0 = SWS_PUMP_OT_CLEAR; }
  : ReadFile { $0 = SWS_READFILE; }
  : Time Warp { $0 = SWS_TIMEWARP; }
  : Shutdown { $0 = SWS_SHUTDOWN; }
  ;
&Cell_SetP <unsigned short>
  : &gain { $0 = $1; }
  ;
&PV_Gi <unsigned short>
  : &gain { $0 = $1; }
  ;
&PV_Gp <unsigned short>
  : &gain { $0 = $1; }
  ;
&GD_Gi <unsigned short>
  : &gain { $0 = $1; }
  ;
&GD_Gp <unsigned short>
  : &gain { $0 = $1; }
  ;
&TV_DP_Set <int16_t>
  : &tvgain { $0 = $1; }
  ;
&TV_Gi <int16_t>
  : &tvgain { $0 = $1; }
  ;
&TV_Gp <int16_t>
  : &tvgain { $0 = $1; }
  ;
