function fig = ghtw(varargin);
% ghtw(...)
% icosfitd
ffig = ne_group(varargin,'icosfitd','phtwscan','phtwp','phtw_t','phtwf','phtwppm','phtwfixflt','phtwstatus');
if nargout > 0 fig = ffig; end
