function phtwmept(varargin);
% phtwmept( [...] );
% ME Plate Temp
h = timeplot({'Plate_T','Plate_Set_T','Plate_Sink_T'}, ...
      'ME Plate Temp', ...
      'Plate Temp', ...
      {'Plate\_T','Plate\_Set\_T','Plate\_Sink\_T'}, ...
      varargin{:} );