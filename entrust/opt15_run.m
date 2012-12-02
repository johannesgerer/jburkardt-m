%% OPT15_RUN
%
%  Modified:
%
%    08 January 2008
%
   %---------------------------------------------------------------------
   %  Gene's test problem
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_15:  exact solutions (, )\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt15_fgh';
   options = [];
   options.verbose            = 0;
   options.max_iterations     = 40;
   options.max_fevals         = 40;
   options.method             = 'secant';
   
   fprintf('Newton:\n')
   options.globalization      = 'trust_region';
   x0 = [ -1; 0 ];
   x = entrust(fname, x0, options);
   fprintf('Newtons method produced  (%10.7e,%10.7e)\n\n',x(1),x(2))
   f = opt15_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );
