function phtwmainss(varargin);
% phtwmainss( [...] );
% Mains Status
h = timeplot({'Mains_I2C_Status','Mains_ADC_Status','Mains_Cmd_Status'}, ...
      'Mains Status', ...
      'Status', ...
      {'Mains\_I2C\_Status','Mains\_ADC\_Status','Mains\_Cmd\_Status'}, ...
      varargin{:} );