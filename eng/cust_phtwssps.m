function cust_phtwssps(h)
% cust_phtwssps(h)
% Customize plot created by phtwssps

% phtwssps's definition:

% function phtwssps(varargin);
% % phtwssps( [...] );
% % SSP Status
% h = timeplot({'SSP_Status'}, ...
%       'SSP Status', ...
%       'Status', ...
%       {'SSP\_Status'}, ...
%       varargin{:} );

% Example customizations include:
%   set(h,'LineStyle','none','Marker','.');
%   ax = get(h(1),'parent');
%   set(ax,'ylim',[0 800]);

ticks = {'Gone','Connect','Ready','Armed','Trig'};
set(h,'LineStyle','none','Marker','.');
ax = get(h(1),'parent');
yl = get(ax,'ylim');
yticks = yl(1):yl(2);
yl = yl + [-.25 .25];
set(ax,'ylim',yl,'ytick',yticks,'yticklabel',{ticks{yticks+1}});
