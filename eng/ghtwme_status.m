function fig = ghtwme_status(varargin);
% ghtwme_status(...)
% ME Status
ffig = ne_group(varargin,'ME Status','phtwme_statusltes','phtwme_statuslpvs','phtwme_statusps','phtwme_statuscs','phtwme_statuscell_status','phtwme_statusdpvs','phtwme_statusbcs');
if nargout > 0 fig = ffig; end
