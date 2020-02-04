function phtwps(varargin);
% phtwps( [...] );
% Pump Status
h = ne_dstat({
  'Scroll_Pump_DS', 'DS08', 4 }, 'Status', varargin{:} );
