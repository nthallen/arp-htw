function phtwstatus(varargin);
% phtwstatus( [...] );
% icosfitd status
h = timeplot({'icosd_fit_status','icosd_status','icos_stale'}, ...
      'icosfitd status', ...
      'status', ...
      {'icosd\_fit\_status','icosd\_status','icos\_stale'}, ...
      varargin{:} );