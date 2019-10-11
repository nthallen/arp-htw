tmcbase = base.tmc
tmcbase = idx.tmc
# tmcbase = qcli.tmc
# tmcbase = ssp.tmc
tmcbase = /usr/local/share/huarp/ptrhm.cc
tmcbase = T30K75KU.tmc
# tmcbase = waves.tmc

colbase = HTWcol.tmc
colbase = idxcol.tmc
colbase = /usr/local/share/huarp/DACS_ID.tmc
# colbase = sspcol.tmc
colbase = ai_init.tmc
colbase = ptrh_chk.tmc
colbase = /usr/local/share/huarp/ptrhm_col.cc

cmdbase = /usr/local/share/huarp/root.cmd
cmdbase = /usr/local/share/huarp/getcon.cmd
cmdbase = /usr/local/share/huarp/idx64.cmd
cmdbase = /usr/local/share/huarp/phrtg.cmd
cmdbase = swstat.cmd
cmdbase = idxdrv.cmd
# cmdbase = qcli.cmd
# cmdbase = ssp.cmd
# cmdbase = waves.cmd
cmdbase = ai.cmd
cmdbase = ao.cmd
cmdbase = dccc.cmd

extbase = ptrh_conv.tmc

genuibase = HTW.genui

Module TMbase
Module Meerstetter src=Meerstetter.txt
Module QCLI mode=noise

SCRIPT = idx.idx64
SCRIPT = dccc.dccc
SCRIPT = interact
# DISTRIB = waves.out
# OBJ = waves.cmd waves.out waves.tmc waves.m waves.log
OBJ = address.h
SRC = swstat.h
IGNORE = Makefile

TGTDIR = $(TGTNODE)/home/HTW

HTWcol : -lsubbus
HTWsrvr : -lsubbus
HTWalgo : ptrh_conv.tmc idxflag.tmc dstat.tmc HTW.tma TV.tma PV.tma
hkdisp : dstat.tmc QCLI_conv.tmc ptrh_conv.tmc hk.tbl
gddisp : dstat.tmc idxflag.tmc gas.tbl
datadisp : dstat.tmc QCLI_conv.tmc SSPrtg.tmc data.tbl /usr/local/share/oui/cic.oui
labdisp : dstat.tmc lab.tbl
doit : HTW.doit
labdoit : lab.doit

%%
CFLAGS=-Wall -g
CXXFLAGS=-Wall -g
COLFLAGS=-Haddress.h
address.h : HTWcol.cc
HTWsrvr.o : address.h
