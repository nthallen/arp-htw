%{
  #include "subbus.h"
  #include "swstat.h"
  #ifdef SERVER
    CmdData_t SWStat;
  #endif
%}

%INTERFACE <SWStat:DG/data>
%INTERFACE <subbus>

&command
  : Fail Light &fon_off * { set_failure($3); }
  : &SWTM * { if_SWStat.Turf(); }
  ;
&SWTM
  : SW Status &swstat {
        SWStat.SW_St = $3;
      }
  : Set Gain Gp for Pinch Valve &gain { SWStat.PV_Gp = $7; }
  : Set Gain Gi for Pinch Valve &gain { SWStat.PV_Gi = $7; }
  : Set Cell Pressure Setpoint &gain { SWStat.PV_SetP = $5; }
  ;
&swstat <int>
  : Set %d { $0 = $2; }
  : Altitude Takeoff { $0 = SWS_TAKEOFF; }
  : Altitude Climb { $0 = SWS_CLIMB; }
  : Altitude Descend { $0 = SWS_DESCEND; }
  : Altitude Land { $0 = SWS_LAND; }

  : Laser Start { $0 = SWS_LASER_START; }
  : Laser Stop { $0 = SWS_LASER_STOP; }
  : Laser Select Waveform and Start { $0 = SWS_LASER_WAVE; }
	
  : Pinch Valve Close { $0 = SWS_PV_CLOSE; }
  : Pinch Valve PI { $0 = SWS_PV_PI; }
  : Pinch Valve Scan { $0 = SWS_PV_SCAN; }

  : Time Warp { $0 = SWS_TIMEWARP; }
  : ReadFile { $0 = SWS_READFILE; }
  : Shutdown { $0 = SWS_SHUTDOWN; }
  ;

&fon_off <int>
  : on { $0 = 1; }
  : off { $0 = 0; }
  : other { $0 = 2; }
  : both { $0 = 3; }
  ;

&gain <unsigned short>
	: %lf ( xx.x ) {
			double val = $1*10 + .5;
			if ( val < 0 ) val = 0.;
			else if ( val > 9999. ) val = 9999.;
			$0 = (unsigned short)val;
		}
	;
