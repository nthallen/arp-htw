%INTERFACE <MKS>

&command
  : Air Flow SetPoint %f (sccm) sccm * { if_MKS.Turf("W1:1:%.0f\n", $4); }
  : Bubbler Flow SetPoint %f (sccm) sccm * { if_MKS.Turf("W2:1:%.3f\n", $4); }
  ;
