function phtwme_cells(varargin);
% phtwme_cells( [...] );
% ME Cell Status
h = timeplot({'Cell_DevStatus'}, ...
      'ME Cell Status', ...
      'Status', ...
      {'Cell\_DevStatus'}, ...
      varargin{:} );
