function phtwa_az(varargin);
% phtwa_az( [...] );
% Attitude Az
h = timeplot({'Sun_Az_Grd'}, ...
      'Attitude Az', ...
      'Az', ...
      {'Sun\_Az\_Grd'}, ...
      varargin{:} );
