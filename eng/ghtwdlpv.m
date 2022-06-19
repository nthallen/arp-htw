function fig = ghtwdlpv(varargin);
% ghtwdlpv(...)
% LPV
ffig = ne_group(varargin,'LPV','phtwdlpvp','phtwdlpvt','phtwdlpvrh','phtwdlpvs','phtwdlpvli');
if nargout > 0 fig = ffig; end
