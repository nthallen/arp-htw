function fig = ghtwqcli(varargin);
% ghtwqcli(...)
% QCLI
ffig = ne_group(varargin,'QCLI','phtwqclis','phtwqcliw','phtwqclistatus','phtwqcliscan','phtwqclissp','phtwqclio');
if nargout > 0 fig = ffig; end
