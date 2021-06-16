function fig = ghtwmelpv(varargin);
% ghtwmelpv(...)
% ME LPV
ffig = ne_group(varargin,'ME LPV','phtwmelpvt','phtwmelpvc','phtwmelpvv','phtwmelpvs');
if nargout > 0 fig = ffig; end
