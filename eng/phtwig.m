function phtwig(varargin);
% phtwig( [...] );
% Inlet Gains
h = timeplot({'TV_Gi','TV_Gp'}, ...
      'Inlet Gains', ...
      'Gains', ...
      {'TV\_Gi','TV\_Gp'}, ...
      varargin{:} );