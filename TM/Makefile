# Makefile Generated Sat Apr 23 10:13:37 CDT 2011
MNC=HTW
HOMEDIR=/home/HTW/src/TM
SPECFILE=HTW.spec
SRC=swstat.h ptrh.h base.tmc idx.tmc qcli.tmc ssp.tmc ptrh.cc
SRC+=waves.tmc HTWcol.tmc idxcol.tmc sspcol.tmc ai_init.tmc
SRC+=ptrh_chk.tmc ptrh_col.cc swstat.cmd idxdrv.cmd qcli.cmd ssp.cmd
SRC+=waves.cmd ai.cmd ao.cmd dccc.cmd ptrh_conv.tmc HTW.tma dstat.tmc
SRC+=qclibits.tmc hk.tbl idxflag.tmc gas.tbl sspflags.tmc SSPrtg.tmc
SRC+=data.tbl lab.tbl HTW.doit lab.doit htweng.edf
TOOL=HTW.spec Makefile
SCRIPT=idx.idx64 dccc.dccc interact
OBJ=waves.cmd waves.out waves.tmc waves.m waves.log address.h
OBJ+=HTWcol.cc HTW.pcm tm.dac HTWcoloui.c HTWcoloui.o HTWcol.o ptrh.o
OBJ+=ptrh_col.o HTWcmd.cc HTWcmd.dat HTWsrvr.o HTWsrvroui.c
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
SRCDIST=HTW.tma hk.tbl gas.tbl data.tbl lab.tbl base.tmc idx.tmc
SRCDIST+=qcli.tmc ssp.tmc ptrh.cc waves.tmc
NONRCS=
TMCBASE=base.tmc idx.tmc qcli.tmc ssp.tmc ptrh.cc waves.tmc
CMDBASE=/usr/local/share/huarp/root.cmd
CMDBASE+=/usr/local/share/huarp/getcon.cmd
CMDBASE+=/usr/local/share/huarp/idx64.cmd
CMDBASE+=/usr/local/share/huarp/phrtg.cmd swstat.cmd idxdrv.cmd
CMDBASE+=qcli.cmd ssp.cmd waves.cmd ai.cmd ao.cmd dccc.cmd
RCS=$(SRC) $(TOOL) $(SCRIPT)
SOURCE=$(RCS) $(NONRCS)
OBJECT=$(OBJ) *.err
TARGET=$(TGT)
DSTRB=$(TGT) $(DISTRIB) $(SCRIPT)
TGTDIR= $(TGTNODE)/home/HTW
include /usr/local/share/huarp/appgen.mk

all : Makefile $(TGT)
Makefile : HTW.spec
	appgen HTW.spec
VERSION=`cat VERSION`
extdistribution : $(DSTRB) $(SRCDIST)
	@[ -d $(TGTDIR)/bin ] || mkdir $(TGTDIR)/bin
	@[ -d $(TGTDIR)/bin/$(VERSION) ] || mkdir $(TGTDIR)/bin/$(VERSION)
	@[ -d  $(TGTDIR)/bin/$(VERSION)/Base ] || mkdir $(TGTDIR)/bin/$(VERSION)/Base
	@distribute $(FORCE) $(TGTDIR)/bin/$(VERSION) $(DSTRB)
	@distribute $(FORCE) $(TGTDIR)/bin/$(VERSION)/Base $(SRCDIST)
distribution : extdistribution
	@distribute $(FORCE) $(TGTDIR) $(IDISTRIB)
HTWcol : HTWcol.o ptrh.o ptrh_col.o HTWcoloui.o
	$(LINK.privCXX) HTWcol.o ptrh.o ptrh_col.o HTWcoloui.o -lsubbus -ltmpp -ltm -lnort
	$(OUIUSE) HTWcoloui.c
	$(PROMOTE) HTWcol
HTWsrvr : HTWsrvr.o HTWsrvroui.o
	$(LINK.privCXX) HTWsrvr.o HTWsrvroui.o -lsubbus -ltmpp -ltm -lnort
	$(OUIUSE) HTWsrvroui.c
	$(PROMOTE) HTWsrvr
HTWalgo : HTWalgo.o ptrh.o HTWalgooui.o
	$(LINK.normCXX) HTWalgo.o ptrh.o HTWalgooui.o -ltmpp -ltm -lnort
	$(OUIUSE) HTWalgooui.c
hkdisp : hkdisp.o ptrh.o hkdispoui.o
	$(LINK.normCXX) hkdisp.o ptrh.o hkdispoui.o -ldisp -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) hkdispoui.c
hkdispnc : hkdispnc.o ptrh.o hkdispncoui.o
	$(LINK.normCXX) hkdispnc.o ptrh.o hkdispncoui.o -ldispnc -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) hkdispncoui.c
gddisp : gddisp.o ptrh.o gddispoui.o
	$(LINK.normCXX) gddisp.o ptrh.o gddispoui.o -ldisp -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) gddispoui.c
gddispnc : gddispnc.o ptrh.o gddispncoui.o
	$(LINK.normCXX) gddispnc.o ptrh.o gddispncoui.o -ldispnc -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) gddispncoui.c
datadisp : datadisp.o ptrh.o datadispoui.o
	$(LINK.normCXX) datadisp.o ptrh.o datadispoui.o -ldisp -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) datadispoui.c
datadispnc : datadispnc.o ptrh.o datadispncoui.o
	$(LINK.normCXX) datadispnc.o ptrh.o datadispncoui.o -ldispnc -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) datadispncoui.c
labdisp : labdisp.o ptrh.o labdispoui.o
	$(LINK.normCXX) labdisp.o ptrh.o labdispoui.o -ldisp -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) labdispoui.c
labdispnc : labdispnc.o ptrh.o labdispncoui.o
	$(LINK.normCXX) labdispnc.o ptrh.o labdispncoui.o -ldispnc -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) labdispncoui.c
doit : HTW.doit
	mkdoit3 -o doit  HTW.doit
labdoit : lab.doit
	mkdoit3 -o labdoit  lab.doit
htwengext : htwengext.o ptrh.o htwengextoui.o
	$(LINK.normCXX) htwengext.o ptrh.o htwengextoui.o -ltmpp -ltm -lssp -lmem -lm -lnort
	$(OUIUSE) htwengextoui.c
HTWclt : HTWclt.o HTWcltoui.o
	$(LINK.normCXX) HTWclt.o HTWcltoui.o -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) HTWcltoui.c
HTWcltnc : HTWcltnc.o HTWcltncoui.o
	$(LINK.normCXX) HTWcltnc.o HTWcltncoui.o -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) HTWcltncoui.c
HTWcol.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc HTWcol.tmc idxcol.tmc /usr/local/share/huarp/DACS_ID.tmc sspcol.tmc ai_init.tmc ptrh_chk.tmc
	$(TMC.col) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc HTWcol.tmc idxcol.tmc /usr/local/share/huarp/DACS_ID.tmc sspcol.tmc ai_init.tmc ptrh_chk.tmc
HTWcoloui.c : $(OUIDIR)/collect.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/collect.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
HTWcoloui.o : HTWcoloui.c
HTWcol.o : HTWcol.cc
ptrh.o : ptrh.cc
ptrh_col.o : ptrh_col.cc
HTWcmd.cc : /usr/local/share/huarp/root.cmd /usr/local/share/huarp/getcon.cmd /usr/local/share/huarp/idx64.cmd /usr/local/share/huarp/phrtg.cmd swstat.cmd idxdrv.cmd qcli.cmd ssp.cmd waves.cmd ai.cmd ao.cmd dccc.cmd
	$(CMDGEN) -d HTWcmd.dat /usr/local/share/huarp/root.cmd /usr/local/share/huarp/getcon.cmd /usr/local/share/huarp/idx64.cmd /usr/local/share/huarp/phrtg.cmd swstat.cmd idxdrv.cmd qcli.cmd ssp.cmd waves.cmd ai.cmd ao.cmd dccc.cmd
HTWsrvr.o : HTWcmd.cc
	$(COMPILE.srvr) HTWcmd.cc
HTWsrvroui.c : $(OUIDIR)/cis.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/cis.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
HTWsrvroui.o : HTWsrvroui.c
HTWalgoa.tmc : HTW.tma HTWsrvr
	$(SERVER) ./HTWsrvr
	$(TMCALGO) -V "`./HTWsrvr -R`" HTW.tma
HTWalgo.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc ptrh_conv.tmc HTWalgoa.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc ptrh_conv.tmc HTWalgoa.tmc
HTWalgooui.c : $(OUIDIR)/tma.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/tma.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
HTWalgooui.o : HTWalgooui.c
HTWalgo.o : HTWalgo.cc
hktbl.tmc : hk.tbl
	$(TABLE) hk.tbl
hkdisp.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc ptrh_conv.tmc /usr/local/share/huarp/flttime.tmc hktbl.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc ptrh_conv.tmc /usr/local/share/huarp/flttime.tmc hktbl.tmc
hkdispoui.c : $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
hkdispoui.o : hkdispoui.c
hkdisp.o : hkdisp.cc
hktblnc.tmc : hk.tbl
	$(NCTABLE) hk.tbl
hkdispnc.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc ptrh_conv.tmc /usr/local/share/huarp/flttime.tmc hktblnc.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc ptrh_conv.tmc /usr/local/share/huarp/flttime.tmc hktblnc.tmc
hkdispncoui.c : $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
hkdispncoui.o : hkdispncoui.c
hkdispnc.o : hkdispnc.cc
gastbl.tmc : gas.tbl
	$(TABLE) gas.tbl
gddisp.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc idxflag.tmc /usr/local/share/huarp/flttime.tmc gastbl.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc idxflag.tmc /usr/local/share/huarp/flttime.tmc gastbl.tmc
gddispoui.c : $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
gddispoui.o : gddispoui.c
gddisp.o : gddisp.cc
gastblnc.tmc : gas.tbl
	$(NCTABLE) gas.tbl
gddispnc.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc idxflag.tmc /usr/local/share/huarp/flttime.tmc gastblnc.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc idxflag.tmc /usr/local/share/huarp/flttime.tmc gastblnc.tmc
gddispncoui.c : $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
gddispncoui.o : gddispncoui.c
gddispnc.o : gddispnc.cc
datatbl.tmc : data.tbl
	$(TABLE) data.tbl
datadisp.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc sspflags.tmc SSPrtg.tmc /usr/local/share/huarp/flttime.tmc datatbl.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc sspflags.tmc SSPrtg.tmc /usr/local/share/huarp/flttime.tmc datatbl.tmc
datadispoui.c : /usr/local/share/oui/cic.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) /usr/local/share/oui/cic.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
datadispoui.o : datadispoui.c
datadisp.o : datadisp.cc
datatblnc.tmc : data.tbl
	$(NCTABLE) data.tbl
datadispnc.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc sspflags.tmc SSPrtg.tmc /usr/local/share/huarp/flttime.tmc datatblnc.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc qclibits.tmc sspflags.tmc SSPrtg.tmc /usr/local/share/huarp/flttime.tmc datatblnc.tmc
datadispncoui.c : /usr/local/share/oui/cic.oui $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) /usr/local/share/oui/cic.oui $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
datadispncoui.o : datadispncoui.c
datadispnc.o : datadispnc.cc
labtbl.tmc : lab.tbl
	$(TABLE) lab.tbl
labdisp.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc /usr/local/share/huarp/flttime.tmc labtbl.tmc
	$(TMC) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc dstat.tmc /usr/local/share/huarp/flttime.tmc labtbl.tmc
labdispoui.c : $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
labdispoui.o : labdispoui.c
labdisp.o : labdisp.cc
labtblnc.tmc : lab.tbl
	$(NCTABLE) lab.tbl
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
.cvsignore :
	@for i in Makefile '.B4*' $(OBJECT) $(TARGET); do echo "$$i"; done >.cvsignore
CFLAGS=-Wall -g
CXXFLAGS=-Wall -g
COLFLAGS=-Haddress.h
address.h : HTWcol.cc
HTWsrvr.o : address.h
waves.cmd waves.out waves.tmc waves.m : waves.qcli
	qclicomp -o waves.out -c waves.cmd -d waves.tmc \
	  -v waves.log -m waves.m waves.qcli || \
	  ( rm -f waves.out waves.cmd waves.tmc waves.log waves.m; false )
