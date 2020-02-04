function phtwps(varargin);
% phtwps( [...] );
% Pump Status
h = ne_dstat({
  'Scroll_Pump_DS', 'DS10', 4 }, 'Status', varargin{:} );
