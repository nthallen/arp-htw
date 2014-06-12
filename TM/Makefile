# Makefile Generated Thu Jun 12 15:11:25 EDT 2014
MNC=HTW
SPECFILE=HTW.spec
PCMFILE=HTW.pcm
SRC=swstat.h base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc HTWcol.tmc
SRC+=idxcol.tmc sspcol.tmc ai_init.tmc swstat.cmd idxdrv.cmd qcli.cmd
SRC+=ssp.cmd waves.cmd ai.cmd ao.cmd dccc.cmd ptrh_conv.tmc
SRC+=idxflag.tmc dstat.tmc HTW.tma TV.tma PV.tma qclibits.tmc hk.tbl
SRC+=gas.tbl sspflags.tmc SSPrtg.tmc data.tbl lab.tbl HTW.doit
SRC+=lab.doit htweng.edf
TOOL=HTW.spec Makefile
SCRIPT=idx.idx64 dccc.dccc interact
OBJ=waves.cmd waves.out waves.tmc waves.m waves.log address.h
OBJ+=HTWcol.cc HTW.pcm tm.dac HTWcoloui.c HTWcoloui.o HTWcol.o
OBJ+=ptrhm.o ptrhm_col.o HTWcmd.cc HTWcmd.dat HTWsrvr.o HTWsrvroui.c
OBJ+=HTWsrvroui.o HTWalgoa.tmc HTWalgo.cc HTWalgooui.c HTWalgooui.o
OBJ+=HTWalgo.o hktbl.tmc hkdisp.cc hkdispoui.c hkdispoui.o hkdisp.o
OBJ+=hktblnc.tmc hkdispnc.cc hkdispncoui.c hkdispncoui.o hkdispnc.o
OBJ+=gastbl.tmc gddisp.cc gddispoui.c gddispoui.o gddisp.o
OBJ+=gastblnc.tmc gddispnc.cc gddispncoui.c gddispncoui.o gddispnc.o
OBJ+=datatbl.tmc datadisp.cc datadispoui.c datadispoui.o datadisp.o
OBJ+=datatblnc.tmc datadispnc.cc datadispncoui.c datadispncoui.o
OBJ+=datadispnc.o labtbl.tmc labdisp.cc labdispoui.c labdispoui.o
OBJ+=labdisp.o labtblnc.tmc labdispnc.cc labdispncoui.c
OBJ+=labdispncoui.o labdispnc.o doit.dep labdoit.dep htwengextedf.oui
OBJ+=htwengext.tmc htwengext.cc htwengextoui.c htwengextoui.o
OBJ+=htwengext.o HTWclt.o HTWcltoui.c HTWcltoui.o HTWcltnc.o
OBJ+=HTWcltncoui.c HTWcltncoui.o
TGT=HTWcol HTWsrvr HTWalgo hkdisp hkdispnc gddisp gddispnc datadisp
TGT+=datadispnc labdisp labdispnc doit labdoit htwengext HTWclt
TGT+=HTWcltnc
DISTRIB=waves.out HTW.pcm tm.dac
IDISTRIB=Experiment.config VERSION doit labdoit
SRCDIST=HTW.tma TV.tma PV.tma hk.tbl gas.tbl data.tbl lab.tbl
SRCDIST+=base.tmc idx.tmc qcli.tmc ssp.tmc
SRCDIST+=/usr/local/share/huarp/ptrhm.cc waves.tmc
TMCBASE=base.tmc idx.tmc qcli.tmc ssp.tmc
TMCBASE+=/usr/local/share/huarp/ptrhm.cc waves.tmc
CMDBASE=/usr/local/share/huarp/root.cmd
CMDBASE+=/usr/local/share/huarp/getcon.cmd
CMDBASE+=/usr/local/share/huarp/idx64.cmd
CMDBASE+=/usr/local/share/huarp/phrtg.cmd swstat.cmd idxdrv.cmd
CMDBASE+=qcli.cmd ssp.cmd waves.cmd ai.cmd ao.cmd dccc.cmd
COLBASE=HTWcol.tmc idxcol.tmc /usr/local/share/huarp/DACS_ID.tmc
COLBASE+=sspcol.tmc ai_init.tmc /usr/local/share/huarp/ptrhm_col.cc
SWSBASE=
QCLIBASE=
PHTGT=hktbl.tmc gastbl.tmc datatbl.tmc labtbl.tmc
RCS=$(SRC) $(TOOL) $(SCRIPT)
SOURCE=$(RCS) $(NONRCS)
OBJECT=$(OBJ) *.err
TARGET=$(TGT)
DSTRB=$(TGT) $(DISTRIB) $(SCRIPT)
TGTDIR= $(TGTNODE)/home/HTW
include /usr/local/share/huarp/appgen.mk

.PHONY : all extdistribution distribution clean check_photon

all : Makefile check_photon $(TGT) .cvsignore
Makefile : HTW.spec
	appgen HTW.spec
VERSION=`cat VERSION`
extdistribution : $(DSTRB) $(SRCDIST) VERSION
	@[ -d $(TGTDIR)/bin ] || mkdir $(TGTDIR)/bin
	@[ -d $(TGTDIR)/bin/$(VERSION) ] || mkdir $(TGTDIR)/bin/$(VERSION)
	@[ -d $(TGTDIR)/bin/$(VERSION)/Base ] || mkdir $(TGTDIR)/bin/$(VERSION)/Base
	@[ ! -f $(TGTDIR)/bin/$(VERSION)/$(PCMFILE) ] || \
	  cmp -s $(TGTDIR)/bin/$(VERSION)/$(PCMFILE) $(PCMFILE) || \
	  ( echo "$(PCMFILE) changed without VERSION update"; false )
	@distribute $(FORCE) $(TGTDIR)/bin/$(VERSION) $(DSTRB)
	@distribute $(FORCE) $(TGTDIR)/bin/$(VERSION)/Base $(SRCDIST)
distribution : extdistribution
	@distribute $(FORCE) $(TGTDIR) $(IDISTRIB)
check_photon :
ifeq ($(WPHOTON),YES)
	@for tgt in $(PHTGT); do \
	  cmp -s $$tgt /usr/local/share/huarp/nulltbl.tmc && echo Remaking $$tgt && rm -f $$tgt; \
	done; true
endif
HTWcol : HTWcol.o ptrhm.o ptrhm_col.o HTWcoloui.o
	$(LINK.privCXX) HTWcol.o ptrhm.o ptrhm_col.o HTWcoloui.o -lsubbus -ltmpp -ltm -lnort
	$(OUIUSE) HTWcoloui.c
	$(PROMOTE) HTWcol
HTWsrvr : HTWsrvr.o HTWsrvroui.o
	$(LINK.privCXX) HTWsrvr.o HTWsrvroui.o -lsubbus -ltmpp -ltm -lnort
	$(OUIUSE) HTWsrvroui.c
	$(PROMOTE) HTWsrvr
HTWalgo : HTWalgo.o ptrhm.o HTWalgooui.o
	$(LINK.normCXX) HTWalgo.o ptrhm.o HTWalgooui.o -ltmpp -ltm -lnort
	$(OUIUSE) HTWalgooui.c
hkdisp : hkdisp.o ptrhm.o hkdispoui.o
	$(LINK.normCXX) hkdisp.o ptrhm.o hkdispoui.o -ldisp -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) hkdispoui.c
hkdispnc : hkdispnc.o ptrhm.o hkdispncoui.o
	$(LINK.normCXX) hkdispnc.o ptrhm.o hkdispncoui.o -ldispnc -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) hkdispncoui.c
gddisp : gddisp.o ptrhm.o gddispoui.o
	$(LINK.normCXX) gddisp.o ptrhm.o gddispoui.o -ldisp -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) gddispoui.c
gddispnc : gddispnc.o ptrhm.o gddispncoui.o
	$(LINK.normCXX) gddispnc.o ptrhm.o gddispncoui.o -ldispnc -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) gddispncoui.c
datadisp : datadisp.o ptrhm.o datadispoui.o
	$(LINK.normCXX) datadisp.o ptrhm.o datadispoui.o -ldisp -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) datadispoui.c
datadispnc : datadispnc.o ptrhm.o datadispncoui.o
	$(LINK.normCXX) datadispnc.o ptrhm.o datadispncoui.o -ldispnc -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) datadispncoui.c
labdisp : labdisp.o ptrhm.o labdispoui.o
	$(LINK.normCXX) labdisp.o ptrhm.o labdispoui.o -ldisp -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) labdispoui.c
labdispnc : labdispnc.o ptrhm.o labdispncoui.o
	$(LINK.normCXX) labdispnc.o ptrhm.o labdispncoui.o -ldispnc -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) labdispncoui.c
doit : HTW.doit
	mkdoit3 -o doit  HTW.doit
labdoit : lab.doit
	mkdoit3 -o labdoit  lab.doit
htwengext : htwengext.o ptrhm.o htwengextoui.o
	$(LINK.normCXX) htwengext.o ptrhm.o htwengextoui.o -ltmpp -ltm -lssp -lmem -lm -lnort
	$(OUIUSE) htwengextoui.c
HTWclt : HTWclt.o HTWcltoui.o
	$(LINK.normCXX) HTWclt.o HTWcltoui.o -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) HTWcltoui.c
HTWcltnc : HTWcltnc.o HTWcltncoui.o
	$(LINK.normCXX) HTWcltnc.o HTWcltncoui.o -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) HTWcltncoui.c
HTWcol.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc HTWcol.tmc idxcol.tmc /usr/local/share/huarp/DACS_ID.tmc sspcol.tmc ai_init.tmc
	$(TMC.col) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc HTWcol.tmc idxcol.tmc /usr/local/share/huarp/DACS_ID.tmc sspcol.tmc ai_init.tmc
HTWcoloui.c : $(OUIDIR)/collect.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/collect.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
HTWcoloui.o : HTWcoloui.c
HTWcol.o : HTWcol.cc
ptrhm.o : /usr/local/share/huarp/ptrhm.cc
	$(COMPILE.cc) /usr/local/share/huarp/ptrhm.cc
ptrhm_col.o : /usr/local/share/huarp/ptrhm_col.cc
	$(COMPILE.cc) /usr/local/share/huarp/ptrhm_col.cc
HTWcmd.cc : /usr/local/share/huarp/root.cmd /usr/local/share/huarp/getcon.cmd /usr/local/share/huarp/idx64.cmd /usr/local/share/huarp/phrtg.cmd swstat.cmd idxdrv.cmd qcli.cmd ssp.cmd waves.cmd ai.cmd ao.cmd dccc.cmd
	$(CMDGEN) -d HTWcmd.dat /usr/local/share/huarp/root.cmd /usr/local/share/huarp/getcon.cmd /usr/local/share/huarp/idx64.cmd /usr/local/share/huarp/phrtg.cmd swstat.cmd idxdrv.cmd qcli.cmd ssp.cmd waves.cmd ai.cmd ao.cmd dccc.cmd
HTWsrvr.o : HTWcmd.cc
	$(COMPILE.srvr) HTWcmd.cc
HTWsrvroui.c : $(OUIDIR)/cis.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/cis.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
HTWsrvroui.o : HTWsrvroui.c
HTWalgoa.tmc : HTW.tma TV.tma PV.tma HTWsrvr
	$(SERVER) ./HTWsrvr
	$(TMCALGO) -V "`./HTWsrvr -R`" HTW.tma TV.tma PV.tma
HTWalgo.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc ptrh_conv.tmc idxflag.tmc dstat.tmc HTWalgoa.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc ptrh_conv.tmc idxflag.tmc dstat.tmc HTWalgoa.tmc
HTWalgooui.c : $(OUIDIR)/tma.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/tma.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
HTWalgooui.o : HTWalgooui.c
HTWalgo.o : HTWalgo.cc
hktbl.tmc : hk.tbl
hkdisp.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc ptrh_conv.tmc /usr/local/share/huarp/flttime.tmc hktbl.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc ptrh_conv.tmc /usr/local/share/huarp/flttime.tmc hktbl.tmc
hkdispoui.c : $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
hkdispoui.o : hkdispoui.c
hkdisp.o : hkdisp.cc
hktblnc.tmc : hk.tbl
hkdispnc.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc ptrh_conv.tmc /usr/local/share/huarp/flttime.tmc hktblnc.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc ptrh_conv.tmc /usr/local/share/huarp/flttime.tmc hktblnc.tmc
hkdispncoui.c : $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
hkdispncoui.o : hkdispncoui.c
hkdispnc.o : hkdispnc.cc
gastbl.tmc : gas.tbl
gddisp.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc idxflag.tmc /usr/local/share/huarp/flttime.tmc gastbl.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc idxflag.tmc /usr/local/share/huarp/flttime.tmc gastbl.tmc
gddispoui.c : $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
gddispoui.o : gddispoui.c
gddisp.o : gddisp.cc
gastblnc.tmc : gas.tbl
gddispnc.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc idxflag.tmc /usr/local/share/huarp/flttime.tmc gastblnc.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc idxflag.tmc /usr/local/share/huarp/flttime.tmc gastblnc.tmc
gddispncoui.c : $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
gddispncoui.o : gddispncoui.c
gddispnc.o : gddispnc.cc
datatbl.tmc : data.tbl
datadisp.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc sspflags.tmc SSPrtg.tmc /usr/local/share/huarp/flttime.tmc datatbl.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc sspflags.tmc SSPrtg.tmc /usr/local/share/huarp/flttime.tmc datatbl.tmc
datadispoui.c : /usr/local/share/oui/cic.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) /usr/local/share/oui/cic.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
datadispoui.o : datadispoui.c
datadisp.o : datadisp.cc
datatblnc.tmc : data.tbl
datadispnc.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc sspflags.tmc SSPrtg.tmc /usr/local/share/huarp/flttime.tmc datatblnc.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc sspflags.tmc SSPrtg.tmc /usr/local/share/huarp/flttime.tmc datatblnc.tmc
datadispncoui.c : /usr/local/share/oui/cic.oui $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) /usr/local/share/oui/cic.oui $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
datadispncoui.o : datadispncoui.c
datadispnc.o : datadispnc.cc
labtbl.tmc : lab.tbl
labdisp.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc /usr/local/share/huarp/flttime.tmc labtbl.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc /usr/local/share/huarp/flttime.tmc labtbl.tmc
labdispoui.c : $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
labdispoui.o : labdispoui.c
labdisp.o : labdisp.cc
labtblnc.tmc : lab.tbl
labdispnc.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc /usr/local/share/huarp/flttime.tmc labtblnc.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc /usr/local/share/huarp/flttime.tmc labtblnc.tmc
labdispncoui.c : $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
labdispncoui.o : labdispncoui.c
labdispnc.o : labdispnc.cc
doit.dep : HTW.doit
	mkdoit3 -M -o doit  HTW.doit
-include doit.dep
labdoit.dep : lab.doit
	mkdoit3 -M -o labdoit  lab.doit
-include labdoit.dep
htwengextedf.oui : htweng.edf
	$(EDF2OUI) htweng.edf
htwengext.tmc : htweng.edf
	$(EDF2EXT) htweng.edf
htwengext.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc ptrh_conv.tmc htwengext.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc ptrh_conv.tmc htwengext.tmc
htwengextoui.c : htwengextedf.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) htwengextedf.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
htwengextoui.o : htwengextoui.c
htwengext.o : htwengext.cc
HTWclt.o : HTWcmd.cc
	$(COMPILE.clt) HTWcmd.cc
HTWcltoui.c : $(OUIDIR)/kbdclt.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/kbdclt.oui $(OUIDIR)/msg.oui
HTWcltoui.o : HTWcltoui.c
HTWcltnc.o : HTWcmd.cc
	$(COMPILE.cltnc) HTWcmd.cc
HTWcltncoui.c : $(OUIDIR)/kbdclt.oui $(OUIDIR)/nctable.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/kbdclt.oui $(OUIDIR)/nctable.oui $(OUIDIR)/msg.oui
HTWcltncoui.o : HTWcltncoui.c

tidy :
	rm -f $(OBJECT)
clean : tidy
	rm -f $(TARGET)
.cvsignore : Makefile
	@for i in $(OBJECT) $(TARGET); do echo "$$i"; done >.cvsignore
CFLAGS=-Wall -g
CXXFLAGS=-Wall -g
COLFLAGS=-Haddress.h
address.h : HTWcol.cc
HTWsrvr.o : address.h
waves.cmd waves.out waves.tmc waves.m : waves.qcli
	qclicomp -o waves.out -c waves.cmd -d waves.tmc \
	  -v waves.log -m waves.m waves.qcli || \
	  ( rm -f waves.out waves.cmd waves.tmc waves.log waves.m; false )
