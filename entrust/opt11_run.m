%% OPT11_RUN
%
%  Modified:
%
%    08 January 2008
%
   %---------------------------------------------------------------------
   %  Running simple quartic polynomial
   %  This is used to test active bound constraints.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_11: (unconstrained)  solution (0, 0, 0)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt11_fgh';
   options = [];
   options.verbose            = 0;
   options.method             = 'newton';
   options.max_iterations     = 2000;
   options.max_fevals         = 2000;
   options.x_lower            = [-100;-100;-100 ];
   options.x_upper            = [ 100; 100; 100 ];
   
   options.verbose = 1;
   fprintf('Newton:\n')
   options.globalization      = 'trust_region';
   x0 = [10; 10; 10];
   x = entrust(fname, x0, options);
   fprintf('Trust-region produced [%10.7e,%10.7e,%10.7e)\n\n',...
      x(1),x(2),x(3))
   f = opt11_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );
   
   fprintf('Newton (constrained x>=1):\n')
   fprintf('Running testcase_11: (constrained)    solution (1, 0, 0)\n')
   options.x_lower            = [ 4; 4; -100];
   x = entrust(fname, x0, options);
   fprintf('Trust-region produced [%10.7e,%10.7e,%10.7e)\n\n',...
      x(1),x(2),x(3))
   f = opt11_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   %---------------------------------------------------------------------
   %  Test Gauss-Newton strategies.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_11 as least squares problem: \n')
   fprintf('Exact solution (0, 0, 0)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt11_rj';
   options = [];
   options.verbose            = 0;
   options.method             = 'gauss_newton';
   options.step_tolerance     = 1.e-15;
   options.globalization      = 'none';
   options.gradient_tolerance = 1.e-10;
   options.max_iterations     = 800;

   x0 = [ 10; 10; 10 ];
   x = entrust(fname, x0, options);

   fprintf('Gauss-Newton produced (%8.5e,%8.5e,%8.5e)\n\n',...
     x(1),x(2),x(3))
   [ res, jac ] = opt11_rj ( x, 'f' );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );
