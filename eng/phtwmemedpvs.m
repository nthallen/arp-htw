function phtwmemedpvs(varargin);
% phtwmemedpvs( [...] );
% ME DPV Status
h = timeplot({'DPV_DevStatus'}, ...
      'ME DPV Status', ...
      'Status', ...
      {'DPV\_DevStatus'}, ...
      varargin{:} );
