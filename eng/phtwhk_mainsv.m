function phtwhk_mainsv(varargin);
% phtwhk_mainsv( [...] );
% Mains Volts
h = timeplot({'Mains_V80V','Mains_V28V'}, ...
      'Mains Volts', ...
      'Volts', ...
      {'Mains\_V80V','Mains\_V28V'}, ...
      varargin{:} );