%{
  #include "address.h"
%}

&command
  : Set &ao_chan %lf (Volts) * {
      double N = $3 * 6553.6;
      unsigned short bits;
      if (N > 65535) N = 65535;
      if (N < 0) N = 0.;
      bits = (unsigned short) N;
      sbwr( $2, bits );
    }
  ;

&ao_chan <unsigned short>
  : LTE Temperature Set Point { $0 = LTETSt_Address; }
  : Gas Flow 1 Set Point { $0 = GsFl1St_Address; }
  : Bubbler Gas Flow Set Point { $0 = BGsFlSt_Address; }
  : LPV Temperature Set Point { $0 = LPVTSt_Address; }
  : DPV Temperature Set Point { $0 = DPVTSt_Address; }
  : Cell Temperature Set Point { $0 = CelTSt_Address; }
  : TE1 Temperature Set Point { $0 = TE1TSt_Address; }
  : Calibration Flow 1 Set Point { $0 = Cal1FSt_Address; }
  : Calibration Flow 2 Set Point { $0 = Cal2FSt_Address; }
  : Calibration Flow 3 Set Point { $0 = Cal3FSt_Address; }
  : TE2 Temperature Set Point { $0 = TE2TSt_Address; }
# : Spare AO 1 { $0 = SpA01St_Address; }
# : Spare AO 2 { $0 = SpA02St_Address; }
# : Spare AO 3 { $0 = SpAO3St_Address; }
# : Spare AO 4 { $0 = SpAO4St_Address; }
# : Spare AO 5 { $0 = SpAO5St_Address; }
  ;
