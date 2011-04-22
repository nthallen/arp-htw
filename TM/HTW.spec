tmcbase = base.tmc
tmcbase = idx.tmc
tmcbase = qcli.tmc
tmcbase = ssp.tmc
tmcbase = ptrh.cc
tmcbase = waves.tmc

cmdbase = /usr/local/share/huarp/root.cmd
cmdbase = /usr/local/share/huarp/getcon.cmd
cmdbase = /usr/local/share/huarp/idx64.cmd
cmdbase = /usr/local/share/huarp/phrtg.cmd
cmdbase = swstat.cmd
cmdbase = idxdrv.cmd
cmdbase = qcli.cmd
cmdbase = ssp.cmd
cmdbase = waves.cmd
cmdbase = ai.cmd
cmdbase = ao.cmd
cmdbase = dccc.cmd

SCRIPT = idx.idx64
SCRIPT = dccc.dccc
SCRIPT = interact
DISTRIB = waves.out
OBJ = waves.cmd waves.out waves.tmc waves.m waves.log
OBJ = address.h
SRC = swstat.h ptrh.h

TGTDIR = $(TGTNODE)/home/HTW

HTWcol : HTWcol.tmc idxcol.tmc /usr/local/share/huarp/DACS_ID.tmc sspcol.tmc ai_init.tmc ptrh_chk.tmc ptrh_col.cc -lsubbus
HTWsrvr : -lsubbus
hkdisp : dstat.tmc qclibits.tmc ptrh_conv.tmc /usr/local/share/huarp/flttime.tmc hk.tbl
gddisp : dstat.tmc idxflag.tmc /usr/local/share/huarp/flttime.tmc gas.tbl
datadisp : dstat.tmc qclibits.tmc sspflags.tmc SSPrtg.tmc /usr/local/share/huarp/flttime.tmc data.tbl /usr/local/share/oui/cic.oui
labdisp : dstat.tmc /usr/local/share/huarp/flttime.tmc lab.tbl
doit : HTW.doit

row1ext : row1.edf
%%
CFLAGS=-Wall -g
CXXFLAGS=-Wall -g
COLFLAGS=-Haddress.h
address.h : HTWcol.cc
HTWsrvr.o : address.h
waves.cmd waves.out waves.tmc waves.m : waves.qcli
	qclicomp -o waves.out -c waves.cmd -d waves.tmc \
	  -v waves.log -m waves.m waves.qcli || \
	  ( rm -f waves.out waves.cmd waves.tmc waves.log waves.m; false )
