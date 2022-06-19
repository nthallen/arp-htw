function fig = ghtwmemelpv(varargin);
% ghtwmemelpv(...)
% ME LPV
ffig = ne_group(varargin,'ME LPV','phtwmemelpvt','phtwmemelpvc','phtwmemelpvv','phtwmemelpvs');
if nargout > 0 fig = ffig; end
