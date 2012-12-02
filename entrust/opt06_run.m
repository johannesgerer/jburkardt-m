%% OPT06_RUN.M
%
%  Modified:
%
%    09 January 2008
%
   %---------------------------------------------------------------------
   %  Running the extended Rosenbrock function (can use any even length
   %  initial vector).
   %  This is used to test secant updates.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_6:  exact solution (1, 1, ...)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt06_fgh';
   options = [];
   options.verbose            = 0;
   options.max_iterations     = 450;
   options.max_fevals         = 450;
   options.method             = 'newton';
   
   fprintf('Newton:\n')
   options.globalization      = 'none';
   x0 = [ -1.2; 1 ];
   x = entrust(fname, x0, options);
   fprintf('Newtons method produced  (%10.7e,%10.7e)\n\n',x(1),x(2))
   f = opt06_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   fprintf('Secant:\n')
   options.method             = 'secant';
   x = entrust(fname, x0, options);
   fprintf('Secant method produced   (%10.7e,%10.7e)\n\n',x(1),x(2))
   f = opt06_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   %---------------------------------------------------------------------
   %  Running the extended Rosenbrock function with box.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_6:  exact solution (0, 0, ...)\n')
   fprintf('Search region constrained to [-100,0] x [-100,100].\n' );
   fprintf('---------------------------------------------------------\n')
   fname = 'opt06_fgh';
   options = [];
   options.verbose            = 0;
   options.max_iterations     = 450;
   options.max_fevals         = 450;
   options.x_lower            = [-100;-100 ];
   options.x_upper            = [   0; 100 ];
   options.method             = 'newton';
   
   fprintf('Newton:\n')
   options.globalization      = 'trust_region';
   x0 = [ -1.2; 1 ];
   x = entrust(fname, x0, options);
   fprintf('Newtons method produced  (%10.7e,%10.7e)\n\n',x(1),x(2))
   f = opt06_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   %---------------------------------------------------------------------
   %  Test Gauss-Newton strategies.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_6 as least squares problem: \n')
   fprintf('Exact solution (1, 1, ...)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt06_rj';
   options = [];
   options.verbose            = 0;
   options.method             = 'gauss_newton';
   options.step_tolerance     = 1.e-15;
   options.globalization      = 'none';
   options.gradient_tolerance = 1.e-10;
   options.max_iterations     = 450;

   x0 = [-1.2; 1];   
   x = entrust(fname, x0, options);

   fprintf('Gauss-Newton produced  (%10.7e, %10.7e)\n\n',x(1),x(2))
   [ res, jac ] = opt06_rj ( x, 'f' );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );
