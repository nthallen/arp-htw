function [Tout,ScanNum] = DCOTSS_time_correction
% [Tout,ScanNum] = DCOTSS_time_correction
% Determines appropriate time values for each ICOS scan number
%%
% Need a continuous range of ssp values
[wvs,ranges] = waves_used;
wvi = find([wvs.ISICOS]);
ranges = ranges(wvi).ranges;
if size(ranges,1) > 1
  warning('More than one range for waveform %s', wvs(wvi).Name);
end
ssp = (ranges(1):ranges(2))';
T = round(time2d(scantime(ssp)));
%%
% dT1 = diff(T)==1;
% % We divide the entire span into contiguous regions where time advances by
% % 1 sec/scan:
% %   starts is the index into ssp1 and T where a region starts
% %   ends is the index into ssp1 and T where a region ends
% %   durs is the number of samples in each region
% starts = find(diff([0;dT1])>0);
% ends = find(diff([dT1;0])<0)+1;
% dur = ends-starts+1;
%%
% If we exclude the first region and the last region, then we can expect
% the remaining regions to be either quite short (less than 60 seconds?) or
% quite long (more than 2000 seconds). The first and last region could be
% any length from 0 up to the 2200s. We can pick an arbitrary threshold of,
% say 100 seconds. If the first region is less than 100 seconds, we will
% consider it part of the unstable period. We will treat the last region
% similarly.
% figure;
% ax = [nsubplot(2,1,1) nsubplot(2,1,2)];
% plot(ax(1),T(starts),dur,'*');
% plot(ax(2),T,T-ssp1);
% title(ax(1),getrun);
%%
% Now combine any pair of contiguous regions where time can simply be
% extended across the gap:
% i=1:length(starts)-1;
% ends(i)
%%
% % Long internal regions
% LIR = find(dur(2:end-1) > 2000)+1;
% T2 = T;
% % We will extend time at 1 sec/scan from the end of each LIR until the
% % beginning of the next LIR (i.e. through the unstable period), effectively
% % inserting a leap second at the end of the unstable period.
% % We will extend time backward with a leap second from the first LIR to the
% % beginning. If the last region is long (>100), we will extend time after
% % the last LIR up until the start of the last region. Otherwise, we will
% % extend time from the last LIR to the end.
% if isempty(LIR) % very short flight?
%   T2 = (1:length(T))';
%   T2 = T2 + mean(T-T2);
% else
%   lsi = starts(LIR(1)); % leap second index
%   Tlsi = T(lsi);
%   T2(1:lsi-1) = (-lsi:-2)'+Tlsi;
%   for i=1:length(LIR)-1
%     unst = ends(LIR(i))+1:starts(LIR(i+1))-1;
%     T2(unst) = (1:length(unst))' + T(unst(1)-1);
%   end
%   if dur(end) > 100
%     endi = starts(end)-1;
%   else
%     endi = ends(end);
%   end
%   unst = ends(LIR(end))+1:endi;
%   T2(unst) = (1:length(unst))' + T(unst(1)-1);
% end
% figure;
% plot(T,T-ssp1,T,T2-ssp1);
% title(getrun);
%%
% figure;
% plot(ssp1,T-ssp1);
%%
before = T-ssp;
start = 1;
T2 = T;
%%
while start < length(T)
  %%
  mindiff = min(T2(start:end)-ssp(start:end));
  Ttest = ssp(start:end) + mindiff;
  lastmatch = find(Ttest == T2(start:end),1,'last');
  T2(start:start+lastmatch-1) = Ttest(1:lastmatch);
  start = start+lastmatch;
end
figure;
h = plot(ssp,before,ssp,T2-ssp);
h(2).LineWidth = 3;
title(sprintf('Time correction: %s', getrun));
xlabel('Scan Number');
ylabel('T-Scan Number');
legend('scantime()','corrected','Location','SouthEast');

if nargout > 0
  Tout = T2;
  if nargout > 1
    ScanNum = ssp;
  end
end
