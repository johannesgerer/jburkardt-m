%% OPT02_RUN
%
%  Modified:
%
%    08 January 2008
%
   %---------------------------------------------------------------------
   %  Running the second testcase, from D+S, pp. 120, 138; x_* = [0;0].
   %  This is used to test globalization strategies.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_2:  exact solution (0, 0)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt02_fgh';
   options = [];
   options.verbose            = 0;
   options.method             = 'newton';
   options.step_tolerance     = 1.e-11;
   options.gradient_tolerance = 1.e-11;
   options.max_iterations     = 15;
   x0 = [ 1; 1];
   
   fprintf('Line Search:\n')
   options.globalization      = 'line_search';
   options.alpha              = 0.1;

   x = entrust(fname, x0, options);

   fprintf('Line search produced  (%10.7e,%10.7e)\n\n',x(1),x(2))
   f = opt02_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   fprintf('Trust Region:\n')
   options.globalization      = 'trust_region';
   options.tr_radius          = 0.5;

   x = entrust(fname, x0, options);

   fprintf('Trust region produced (%10.7e,%10.7e)\n\n',x(1),x(2))
   f = opt02_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );
   %---------------------------------------------------------------------
   %  Test Gauss-Newton strategies.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_2 as least squares problem: \n')
   fprintf('Exact solution (0,0)\n')
   fprintf('---------------------------------------------------------\n')

   fname = 'opt02_rj';
   options = [];
   options.verbose            = 0;
   options.method             = 'gauss_newton';
   options.step_tolerance     = 1.e-15;
   options.globalization      = 'none';
   options.gradient_tolerance = 1.e-10;
   options.max_iterations     = 40;

   x0 = [1,1];   

   x = entrust(fname, x0, options );

   fprintf('Gauss-Newton produced  (%10.7e, %10.7e)\n\n',x(1),x(2))
   [ res, jac ] = opt02_rj ( x, 'f' );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );
