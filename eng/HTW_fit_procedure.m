%%
% Fitting procedure
HTWeng2PT
%%
[wvs,regions] = waves_used;
wvi = find([wvs.ISICOS]);
if ~isscalar(wvi)
  if isempty(wvi)
    error('No ICOS scans found');
  else
    error('More than one ICOS waveform found');
  end
end
if size(regions(wvi).ranges,1) > 1; warn('More than on ICOS range'); end
scans = regions(wvi).ranges(1,:);
scans = (scans(1):scans(2))';
scanview(scans);
%%
% Update scans based on scanview
etln_fit('scannum',scans,'OFILE','PTE.txt','SAVEALL',1);
%%
eft = etln_fine_tune('PTE.txt');
if wvs(wvi).NetSamples > 2000
  eft.Nsmooth = 100;
else
  eft.Nsmooth = 50;
end
%%
eft.tune_scans;
%%
eft.view_tune;
%%
% Update ICOSfit cfg to point to the SSPf
edit_ICOSfit_cfg
%%
fitline
% Define suffix for 7LF and save
% Define suffix for 1LF, disable all but bit line, save
% Define region 'opt' for baseline optimization
% matchline to  create icosfit.opt.1LF
%%
% Setup for the 1L baseline optimization
icosfit_reconfig('icosfit.opt.1LF','', ...
  'nu0', '3777', ...
  'MaxEnsembleDriftPerScan','2e-3 cm-1', ...
  'MaxIterations','20', ...
  'PTEFile','PTE.txt', ...
  'FineTuned', []);
%%
OptB1LF = baseline_optimizer('mnemonic','OptB1LF', ...
  'cfg_ref','icosfit.opt.1LF','PTEFile','PTE.txt');
OptB1LF.new_polynomial(3);
OptB1LF.analyze_etalons; drawnow;
OptB1LF.rrfit();
%%
for i = 1:5
  OptB1LF.add_etalon;
  OptB1LF.rescale_baseline;
  OptB1LF.analyze_etalons; drawnow;
end
%%
% Copy baseline file down, then
fitline
% Define all region for full fit
% Select new  baseline file
% matchline to create icosfit.all.1LF
%%
icosfit_reconfig('icosfit.all.1LF','', ...
  'nu0', '3777', ...
  'OutputDir','ICOSout.all.1LF', ...
  'MaxEnsembleDriftPerScan','2e-3 cm-1', ...
  'MaxIterations','20', ...
  'PTEFile','PTE.txt', ...
  'Verbosity', '3', ...
  'FineTuned', []);

%%
% icosfit icosfit.all.1LF
S = ICOS_setup('ICOSout.all.1LF');
figure; plot(S.scannum,S.nu_F0);
rrfit('ICOSout.all.1LF');
%%
PTE_add_nu_F0('ICOSout.all.1LF','PTE_nu.txt');
%%
fitline
% Select already defined suffix .7LF
% Select region 'all'
% matchline to create icosfit.all.7LF (all)
% Select
% Group Lines
%%
icosfit_reconfig('icosfit.all.7LF','', ...
  'nu0', '3777', ...
  'MaxEnsembleDriftPerScan','2e-3 cm-1', ...
  'MaxIterations','20', ...
  'PTEFile','PTE_nu.txt + nu_F0', ...
  'Verbosity','3', ...
  'FineTuned', []);
%% HERE
OptB7LF = baseline_optimizer('mnemonic','OptB7LF', ...
  'cfg_ref','icosfit.all.7LF', ...
  'PTEFile','PTE_nu.txt', ...
  'nscans', 50);
OptB7LF.new_polynomial(5);
OptB7LF.analyze_etalons; set(gca,'XScale','log');
%%
for i = 1:3
  %%
  OptB7LF.add_etalon; drawnow
  OptB7LF.rescale_baseline; drawnow
  OptB7LF.analyze_etalons; set(gca,'XScale','log'); drawnow
end
%%
% Select desired baseline file
icosfit_reconfig('icosfit.all.7LF','', ...
  'BaselineFile', 'OptB7LF/sbase.5p3er.ptb');
%%
% Run icosfit icosfit.all.7BF
