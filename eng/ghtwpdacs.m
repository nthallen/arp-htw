function fig = ghtwpdacs(varargin);
% ghtwpdacs(...)
% PDACS
ffig = ne_group(varargin,'PDACS','phtwpdacst','phtwpdacsioss','phtwpdacsv','phtwpdacsi','phtwpdacspms','phtwpdacsais');
if nargout > 0 fig = ffig; end
