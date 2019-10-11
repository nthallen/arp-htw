function fig = ghtwqcli_stat(varargin);
% ghtwqcli_stat(...)
% QCLI stat
ffig = ne_group(varargin,'QCLI stat','phtwqcli_statsn','phtwqcli_stats','phtwqcli_staterr','phtwqcli_statfifodep','phtwqcli_statflash','phtwqcli_statmode','phtwqcli_statrw','phtwqcli_statstatus','phtwqcli_statskip');
if nargout > 0 fig = ffig; end
