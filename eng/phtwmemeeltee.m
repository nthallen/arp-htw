function phtwmemeeltee(varargin);
% phtwmemeeltee( [...] );
% ME Errors LTE Errors
h = timeplot({'LTE_ErrorNumber','LTE_ErrorInstance','LTE_ErrorParameter'}, ...
      'ME Errors LTE Errors', ...
      'LTE Errors', ...
      {'LTE\_ErrorNumber','LTE\_ErrorInstance','LTE\_ErrorParameter'}, ...
      varargin{:} );
