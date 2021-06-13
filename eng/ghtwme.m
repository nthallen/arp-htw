function fig = ghtwme(varargin);
% ghtwme(...)
% ME
ffig = ne_group(varargin,'ME','phtwmes','phtwmeltet','phtwmelpvt','phtwmept','phtwmect','phtwmecell_temp','phtwmedpvt','phtwmebct');
if nargout > 0 fig = ffig; end
