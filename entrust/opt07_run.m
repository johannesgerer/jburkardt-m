%% OPT07_RUN
%
%  Modified:
%
%    09 January 2008
%
   %---------------------------------------------------------------------
   %  Running the Helical Valley Function
   %  This is used to test globalization methods.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_7:  exact solution (1, 0, 0)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt07_fgh';
   options = [];
   options.verbose            = 0;
   options.method             = 'secant';
   options.max_iterations     = 100;
   options.max_fevals         = 100;
   
   fprintf('Secant:\n')
   options.globalization      = 'line_search';
   x0 = [ -1; 0; 0 ];
   x = entrust(fname, x0, options);
   fprintf('Line search produced  (%10.7e,%10.7e,%10.7e)\n\n',x(1),x(2),x(3))
   f = opt07_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   fprintf('Secant:\n')
   options.globalization      = 'trust_region';
   options.tr_radius          = 0.5;
   x = entrust(fname, x0, options);
   fprintf('Trust-region produced (%10.7e,%10.7e,%10.7e)\n\n',x(1),x(2),x(3))
   f = opt07_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );
   %---------------------------------------------------------------------
   %  Test Gauss-Newton strategies.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_7 as least squares problem: \n')
   fprintf('Exact solution (1, 0, 0)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt07_rj';
   options = [];
   options.verbose            = 0;
   options.method             = 'gauss_newton';
   options.step_tolerance     = 1.e-15;
   options.globalization      = 'none';
   options.gradient_tolerance = 1.e-10;
   options.max_iterations     = 100;

   x0 = [-1; 0; 0];   

   x = entrust(fname, x0, options );

   fprintf('Gauss-Newton produced  (%10.7e,%10.7e,%10.7e)\n\n',x(1),x(2),x(3))
   [ res, jac ] = opt07_rj ( x, 'f' );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );
