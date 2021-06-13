function fig = ghtwme_stale(varargin);
% ghtwme_stale(...)
% ME Stale
ffig = ne_group(varargin,'ME Stale','phtwme_staleltes','phtwme_stalelpvs','phtwme_staleps','phtwme_stalecs','phtwme_stalecell_stale','phtwme_staledpvs','phtwme_stalebcs');
if nargout > 0 fig = ffig; end
