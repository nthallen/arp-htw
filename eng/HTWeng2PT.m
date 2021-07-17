function HTWeng2PT
%This is a customized eng to PT file conversion program for HCI and HHH.
%This creates the PT.mat file required by the ICOSfit programs.
cfg = load_ICOSfit_cfg;
runs = ne_load_runsdir('HTW_Data_Dir');
run = getrun(1);
E1 = load_eng('htweng_1.mat', runs, run);
E4 = load_eng('htweng_4.mat', runs, run);
if isempty(E1) || isempty(E4)
    return;
end
T1 = E1.Thtweng_1;
T4 = E4.Thtweng_4;

% PT.TPT = T4;
% PT.CellP = interp1(T1,E1.CellP,T4); % cell pressure (in Torr)
% PT.Tavg = (273.15 + 20).*T4./T4; % cell temperature (in K)
% PT.ScanNum = E4.SSP_Num;
% PT.QCLI_Wave = interp1(T1,E1.QCLI_Wave,T4,'nearest','extrap');
%calibration of cell T 210504.1 using Fluke T probe accuracy +/- 0.05 oC
E1.TS1_T=1.0269*E1.TS1_T-.9307;
E1.TS2_T=1.0293*E1.TS2_T-.9699;
E1.TS3_T=1.0266*E1.TS3_T-.8123;

PT.TPT = T1;
PT.CellP = E1.CellP; % cell pressure (in Torr)
PT.Tavg = 273.15 + (E1.TS1_T + E1.TS2_T)/2; % cell temperature (in K)
PT.ScanNum = E1.SSP_Num;
PT.QCLI_Wave = E1.QCLI_Wave;

save PT.mat -STRUCT PT

function E = load_eng(base, runs, run)
file = base;
if ~exist(file, 'file')
    file = [runs '/' run '/' file];
end
if exist(file, 'file')
    E = load(file);
else
    fprintf(1,'Unable to locate engineering data file "%s"\n', base);
    E = [];
end
