tmcbase = base.tmc
tmcbase = idx.tmc
tmcbase = /usr/local/share/huarp/ptrhm.cc
tmcbase = T30K75KU.tmc
tmcbase = TS.tmc
tmcbase = TS_T_t_cal.tmc

colbase = idxcol.tmc
colbase = /usr/local/share/huarp/DACS_ID.tmc
colbase = ai_init.tmc
colbase = ptrh_chk.tmc
colbase = /usr/local/share/huarp/ptrhm_col.cc
colbase = TS_col.tmc

cmdbase = /usr/local/share/huarp/root.cmd
cmdbase = /usr/local/share/huarp/getcon.cmd
cmdbase = /usr/local/share/huarp/idx64.cmd
cmdbase = /usr/local/share/huarp/phrtg.cmd
cmdbase = swstat.cmd
cmdbase = idxdrv.cmd
cmdbase = ai.cmd
# cmdbase = ao.cmd
cmdbase = dccc.cmd

extbase = ptrh_conv.tmc
extbase = TS_conv.tmc

swsbase = HTW.sws

genuibase = HTW.genui
genuibase = TS.genui
genuibase = SW.genui

Module TMbase
Module Meerstetter src=Meerstetter.txt
Module QCLI mode=noise
Module mksflow src=mksflow.txt
Module mains
Module IWG1

SCRIPT = idx.idx64
SCRIPT = dccc.dccc
SCRIPT = interact runfile.FC
OBJ = address.h
IGNORE = Makefile

TGTDIR = $(TGTNODE)/home/HTW

HTWcol : -lsubbus
HTWsrvr : -lsubbus mains.oui
HTWalgo : ptrh_conv.tmc idxflag.tmc dstat.tmc \
          mains_conv.tmc HTW.tma Flow.tma Throttle.tma TEC.tma HTW.sws
hkdisp : dstat.tmc QCLI_conv.tmc ptrh_conv.tmc hk.tbl
gddisp : dstat.tmc idxflag.tmc mains_conv.tmc gas.tbl
datadisp : dstat.tmc QCLI_conv.tmc SSPrtg.tmc data.tbl /usr/local/share/oui/cic.oui
TSdisp : TS_conv.tmc TS.tbl
IWG1disp : IWG1.tbl
doit : HTW.doit
# labdisp : dstat.tmc lab.tbl
# labdoit : lab.doit
udpext : Status/UDP.cc UDP.tmc -lsocket

%%
CFLAGS=-Wall -g
CXXFLAGS=-Wall -g
COLFLAGS=-Haddress.h
address.h : HTWcol.cc
HTWsrvr.o : address.h
