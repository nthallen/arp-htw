function fig = ghtwddpv(varargin);
% ghtwddpv(...)
% DPV
ffig = ne_group(varargin,'DPV','phtwddpvp','phtwddpvt','phtwddpvrh','phtwddpvs','phtwddpvct','phtwddpvc');
if nargout > 0 fig = ffig; end
