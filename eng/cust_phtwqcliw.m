function cust_phtwqcliw(h)
% cust_phtwqcliw(h)
% Customize plot created by phtwqcliw

% phtwqcliw's definition:

% function phtwqcliw(varargin);
% % phtwqcliw( [...] );
% % QCLI Wave
% h = timeplot({'QCLI_Wave'}, ...
%       'QCLI Wave', ...
%       'Wave', ...
%       {'QCLI\_Wave'}, ...
%       varargin{:} );

% Example customizations include:
%   set(h,'LineStyle','none','Marker','.');
%   ax = get(h(1),'parent');
%   set(ax,'ylim',[0 800]);

set(h,'LineStyle','none','Marker','.');
ax = get(h,'parent');
waves = load_wavespecs('waves.m');
ydata = get(h,'ydata');
if ~isempty(waves)
    wvnos = unique(ydata)+1;
    map = zeros(max(wvnos),1);
    map(wvnos) = 1:length(wvnos);
    ydata = map(ydata+1);
    set(h,'ydata',ydata);
    set(ax,'ylim', [ 0.9 length(wvnos)+0.1 ], 'ytick', 1:length(wvnos), ...
        'yticklabel', strrep({waves(wvnos).Name},'_','\_'));
else
    set(ax,'ylim', [ min(ydata)-0.1 max(ydata)+0.1]);
end

function WaveSpecs = load_wavespecs(filename)
HWVdir = HTW_Data_Dir;
rundir = getrun(1);
dirs = { filesep [filesep 'Base' filesep] };
for i=1:length(dirs)
    path = [HWVdir filesep rundir dirs{i} filename];
    if exist(path,'file')
        eval(['run ' path ';'])
        return;
    end
end
WaveSpecs = [];
