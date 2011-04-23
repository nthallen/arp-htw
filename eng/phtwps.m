function phtwps(varargin);
% phtwps( [...] );
% Pump Status
h = ne_dstat({
  'Scroll_Pump_DS', 'DS822', 0; ...
	'Scroll_Pump_S', 'DS844', 0 }, 'Status', varargin{:} );
