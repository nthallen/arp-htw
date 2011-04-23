function fig = ghtwlpv(varargin);
% ghtwlpv(...)
% LPV
ffig = ne_group(varargin,'LPV','phtwlpvt','phtwlpvct','phtwlpvlt','phtwlpvli');
if nargout > 0 fig = ffig; end
