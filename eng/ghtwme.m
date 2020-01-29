function fig = ghtwme(varargin);
% ghtwme(...)
% ME
ffig = ne_group(varargin,'ME','phtwmes','phtwmeltes','phtwmeltet','phtwmelpvs','phtwmelpvt','phtwmeps','phtwmept','phtwmecs','phtwmect','phtwmecell_status','phtwmecell_temp','phtwmedpvs','phtwmedpvt','phtwmebcs','phtwmebct');
if nargout > 0 fig = ffig; end
