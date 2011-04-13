# Makefile Generated Wed Apr 13 09:51:26 CDT 2011
MNC=HTW
HOMEDIR=/home/HTW/src/TM
SPECFILE=HTW.spec
SRC=swstat.h ptrh.h base.tmc idx.tmc qcli.tmc ssp.tmc ptrh.cc
SRC+=waves.tmc HTWcol.tmc sspcol.tmc swstat.cmd idxdrv.cmd qcli.cmd
SRC+=ssp.cmd waves.cmd ai.cmd ao.cmd dccc.cmd
TOOL=HTW.spec Makefile
SCRIPT=idx.idx64 dccc.dccc interact
OBJ=waves.cmd waves.out waves.tmc waves.m waves.log address.h
OBJ+=HTWcol.cc HTW.pcm tm.dac HTWcoloui.c HTWcoloui.o HTWcol.o ptrh.o
OBJ+=HTWcmd.cc HTWcmd.dat HTWsrvr.o HTWsrvroui.c HTWsrvroui.o
OBJ+=HTWclt.o HTWcltoui.c HTWcltoui.o HTWcltnc.o HTWcltncoui.c
OBJ+=HTWcltncoui.o
TGT=HTWcol HTWsrvr HTWclt HTWcltnc
DISTRIB=HTW.pcm tm.dac
IDISTRIB=Experiment.config VERSION
SRCDIST=base.tmc idx.tmc qcli.tmc ssp.tmc ptrh.cc waves.tmc
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
TGTDIR= $(TGTNODE)/home/htw
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
HTWcol : HTWcol.o ptrh.o HTWcoloui.o
	$(LINK.privCXX) HTWcol.o ptrh.o HTWcoloui.o -lsubbus -ltmpp -ltm -lnort
	$(OUIUSE) HTWcoloui.c
	$(PROMOTE) HTWcol
HTWsrvr : HTWsrvr.o HTWsrvroui.o
	$(LINK.privCXX) HTWsrvr.o HTWsrvroui.o -lsubbus -ltmpp -ltm -lnort
	$(OUIUSE) HTWsrvroui.c
	$(PROMOTE) HTWsrvr
HTWclt : HTWclt.o HTWcltoui.o
	$(LINK.normCXX) HTWclt.o HTWcltoui.o -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) HTWcltoui.c
HTWcltnc : HTWcltnc.o HTWcltncoui.o
	$(LINK.normCXX) HTWcltnc.o HTWcltncoui.o -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) HTWcltncoui.c
HTWcol.cc : base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc HTWcol.tmc sspcol.tmc
	$(TMC.col) base.tmc idx.tmc qcli.tmc ssp.tmc waves.tmc HTWcol.tmc sspcol.tmc
HTWcoloui.c : $(OUIDIR)/collect.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/collect.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
HTWcoloui.o : HTWcoloui.c
HTWcol.o : HTWcol.cc
ptrh.o : ptrh.cc
HTWcmd.cc : /usr/local/share/huarp/root.cmd /usr/local/share/huarp/getcon.cmd /usr/local/share/huarp/idx64.cmd /usr/local/share/huarp/phrtg.cmd swstat.cmd idxdrv.cmd qcli.cmd ssp.cmd waves.cmd ai.cmd ao.cmd dccc.cmd
	$(CMDGEN) -d HTWcmd.dat /usr/local/share/huarp/root.cmd /usr/local/share/huarp/getcon.cmd /usr/local/share/huarp/idx64.cmd /usr/local/share/huarp/phrtg.cmd swstat.cmd idxdrv.cmd qcli.cmd ssp.cmd waves.cmd ai.cmd ao.cmd dccc.cmd
HTWsrvr.o : HTWcmd.cc
	$(COMPILE.srvr) HTWcmd.cc
HTWsrvroui.c : $(OUIDIR)/cis.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/cis.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
HTWsrvroui.o : HTWsrvroui.c
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
