%% OPT10_RUN
%
%  Modified:
%
%    08 January 2008
%
   %---------------------------------------------------------------------
   %  Running the Wood Function
   %  This is used to test globalization methods.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_10: exact solution (1, 1, 1, 1)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt10_fgh';
   options = [];
   options.verbose            = 0;
   options.method             = 'newton';
   options.max_iterations     = 2000;
   options.max_fevals         = 2000;
   
   fprintf('Newton:\n')
   options.globalization      = 'line_search';
   x0 = [-3; -1; -3; -1 ];
   x = entrust(fname, x0, options);
   fprintf('Line search produced  (%10.7e,%10.7e,%10.7e,%10.7e)\n\n',...
      x(1),x(2),x(3),x(4))
   f = opt10_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   fprintf('Newton:\n')
   options.globalization      = 'trust_region';
   x = entrust(fname, x0, options);
   fprintf('Trust-region produced (%10.7e,%10.7e,%10.7e,%10.7e)\n\n',...
      x(1),x(2),x(3),x(4))
   f = opt10_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   fprintf('Secant:\n')
   options.method             = 'secant';
   options.initial_hessian    = eye(4);
   options.globalization      = 'trust_region';
   x = entrust(fname, x0, options);
   fprintf('Trust-region produced (%10.7e,%10.7e,%10.7e,%10.7e)\n\n',...
      x(1),x(2),x(3),x(4))
   f = opt10_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   %---------------------------------------------------------------------
   %  Test Gauss-Newton strategies.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_10 as least squares problem: \n')
   fprintf('Exact solution (1,1,1,1)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt10_rj';
   options = [];
   options.verbose            = 0;
   options.method             = 'gauss_newton';
   options.step_tolerance     = 1.e-15;
   options.globalization      = 'none';
   options.gradient_tolerance = 1.e-10;
   options.max_iterations     = 2000;
   options.max_fevals         = 2000;

   x0 = [-3; -1; -3; -1 ];
   x = entrust(fname, x0, options);

   fprintf('Gauss-Newton produced (%8.5e,%8.5e,%8.5e,%8.5e)\n\n',...
     x(1),x(2),x(3),x(4))
   [ res, jac ] = opt10_rj ( x, 'f' );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );
