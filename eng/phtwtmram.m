function phtwtmram(varargin);
% phtwtmram( [...] );
% T Mbase RAM
h = timeplot({'freemem'}, ...
      'T Mbase RAM', ...
      'RAM', ...
      {'freemem'}, ...
      varargin{:} );
