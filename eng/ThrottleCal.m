%%
fig1 = 0;
runs = {
  '210720.2F',
  '210723.2F',
  '210726.2F',
  '210729.2F',
  '210802.2F',
  '210807.1F'
  };
N = length(runs);
stds = zeros(1,N);
outliers = zeros(1,N);
for i = N:-1:1
  run = runs{i};
  fpath = sprintf('RAW/%s/htweng_1.mat',run);
  htweng_1 = load(fpath);
  TVStep = htweng_1.TVStep;
  TVPos = htweng_1.TVPos;
  V = TVStep < 50000 & TVStep > 0 & TVPos <= 4.095;
  Vars(i) = struct('TVStep',TVStep(V),'TVPos',TVPos(V));
end
%%
TVStep = {Vars.TVStep};
TVStep = vertcat(TVStep{:});
TVPos = {Vars.TVPos};
TVPos = vertcat(TVPos{:});
P = polyfit(TVStep,TVPos,1);
StepRange = [0 8000];
PosFit = polyval(P,TVStep);
resid = TVPos - PosFit;
PosStd = std(resid);
maxoutlier = max(abs(resid));
fprintf(1,'PotV = %f * Step + %f +/- %f: ', P(1), P(2), PosStd);
fprintf('Max outlier %.3f V, %.1f x std\n', maxoutlier, maxoutlier/PosStd);
Ymax = maxoutlier + PosStd;
dV = 2*Ymax;
dS = dV/P(1);
fprintf(1,'Minimum required movement is %.0f steps\n',dS);
%%
figure;
for i = N:-1:1
  ax(i) = nsubplot(N,1,i);
end
for i = 1:N
  run = runs{i};
  TVStep = Vars(i).TVStep;
  TVPos = Vars(i).TVPos;
  PosFit2 = polyval(P,TVStep);
  resid = TVPos-PosFit2;
  PosStd = std(resid);
  PosMean = mean(resid);
  TVoffset = PosMean/P(1);
  %TVStep0 = (TVPos(1) - P(2))/P(1);
  %TVoffset = TVStep0-TVStep(1);
  TVStep = TVStep + TVoffset;
  PosFit = polyval(P,TVStep);
  resid = TVPos - PosFit;
  Vars(i).TVStep = TVStep;
  if fig1
    figure; plot(TVStep,TVPos,'.', StepRange, PosFit);
    title(sprintf('Flight %s: %f V/Step', run, P(1)));
    ylabel('Pot V');
    xlabel('Step');
    ylim([0 4.1]);
    xlim([0 6000]);
    grid;
  end
  PosFit2 = polyval(P,TVStep);
  resid = TVPos-PosFit2;
  PosStd = std(resid);
  PosMean = mean(resid);
  fprintf(1,'%s: PotV residual mean %7.4f, std %f, mean/std %7.4f\n', ...
    run, PosMean, PosStd, PosMean/PosStd);
  %stds(i) = PosStd;
  plot(ax(i),TVStep,resid,'.');
  grid(ax(i),'on');
  ylabel(ax(i),run);
  %outliers(i) = max(abs(resid));
  %max_outlier = outliers(i)/PosStd;
  %fprintf(1,'%s: %f * Step + %f +/- %f Max outlier %.1f x std\n', run, P(1), P(2), PosStd, max_outlier);
end
set(ax(1:2:end),'YAxisLocation','Right');
set(ax(1:end-1),'XTickLabel',[]);
linkaxes(ax,'x');
set(ax,'YLim',[-Ymax Ymax]);
%%
TVStep = {Vars.TVStep};
TVStep = vertcat(TVStep{:});
TVPos = {Vars.TVPos};
TVPos = vertcat(TVPos{:});
P = polyfit(TVStep,TVPos,1);
StepRange = [0 8000];
PosFit = polyval(P,TVStep);
resid = TVPos - PosFit;
PosStd = std(resid);
maxoutlier = max(abs(resid));
fprintf(1,'After Initializing Step based on pot position:\n');
fprintf(1,'PotV = %f * Step + %f +/- %f: ', P(1), P(2), PosStd);
fprintf('Max outlier %.3f V, %.1f x std\n', maxoutlier, maxoutlier/PosStd);
Ymax = maxoutlier + PosStd;
dV = 2*Ymax;
dS = dV/P(1);
fprintf(1,'Minimum required movement is %.0f steps\n',dS);
