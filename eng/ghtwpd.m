function fig = ghtwpd(varargin);
% ghtwpd(...)
% PD
ffig = ne_group(varargin,'PD','phtwpdt','phtwpddp','phtwpdp');
if nargout > 0 fig = ffig; end
