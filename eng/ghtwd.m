function fig = ghtwd(varargin);
% ghtwd(...)
% icosfitd
ffig = ne_group(varargin,'icosfitd','phtwdscan','phtwdp','phtwdt','phtwdf','phtwdppm','phtwdfixflt','phtwdstatus');
if nargout > 0 fig = ffig; end
