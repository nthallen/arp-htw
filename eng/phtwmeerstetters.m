function phtwmeerstetters(varargin);
% phtwmeerstetters( [...] );
% Meerstetter Status
h = timeplot({'LTE_DevStatus'}, ...
      'Meerstetter Status', ...
      'Status', ...
      {'LTE\_DevStatus'}, ...
      varargin{:} );