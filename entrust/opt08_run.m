%% OPT08_RUN
%
%  Modified:
%
%    06 January 2008
%
   %---------------------------------------------------------------------
   %  Running the extended Powell singular function (with dimension of
   %  positive integer*4)
   %  This is used to test globalization methods.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_8:  exact solution (0, 0, ...)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt08_fgh';
   options = [];
   options.verbose            = 0;
   options.method             = 'newton';
   options.max_iterations     = 800;
   options.max_fevals         = 800;
   
   fprintf('Newton:\n')
   options.globalization      = 'line_search';
   x0 = [ 3, -1, 0, 1 ]; % 3, -1, 0, 1, ...
   x = entrust(fname, x0, options);
   fprintf('Line search produced   (%8.5e, %8.5e',x(1),x(2))
   fprintf('%8.5e, %8.5e)\n\n',x(3),x(4))
   f = opt08_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   fprintf('Newton:\n')
   options.tr_radius          = 1.0;
   options.globalization      = 'trust_region';
   x = entrust(fname, x0, options);
   fprintf('Trust region produced  (%8.5e, %8.5e, ',x(1),x(2))
   fprintf('%8.5e, %8.5e)\n\n',x(3),x(4))
   f = opt08_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   %---------------------------------------------------------------------
   %  Test Gauss-Newton strategies.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_8 as least squares problem: \n')
   fprintf('Exact solution (0, 0, ...)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt08_rj';
   options = [];
   options.verbose            = 0;
   options.method             = 'gauss_newton';
   options.step_tolerance     = 1.e-15;
   options.globalization      = 'none';
   options.gradient_tolerance = 1.e-10;
   options.max_iterations     = 800;

   x0 = [ 3, -1, 0, 1 ];;   
   x = entrust(fname, x0, options);

   fprintf('Gauss-Newton produced   (%8.5e, %8.5e, %8.5',x(1),x(2))
   fprintf('%8.5e, %8.5e)\n\n',x(3),x(4))
   [ res, jac ] = opt08_rj ( x, 'f' );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );
