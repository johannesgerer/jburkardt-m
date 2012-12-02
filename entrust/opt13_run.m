%% OPT13_RUN
%
%  Modified:
%
%    12 February 2008
%
   %---------------------------------------------------------------------
   %  Use NEWTON method.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Test case 13 as a standard minimization problem.\n' );
   fprintf('Use Newton''s method.\n' );
   fprintf('The function is badly scaled.\n' );
   fprintf('There is a local minimizer at X=(0.285,0.279), F(X)=5.92\n' );
   fprintf('There is a global minimizere at X=-21.02,36.76), F(X)=0.0\n' );
   fprintf('---------------------------------------------------------\n')

   fname = 'opt13_fgh';
   options = [];
   options.max_iterations     = 30;
   options.method             = 'newton';
   
   fprintf('Newton:\n')

   x0 = [ 1; 1 ];
   x = entrust(fname, x0, options);

   fprintf('Newton''s method produced  (%10.7e,%10.7e)\n\n',x(1),x(2))
   f = opt13_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   %---------------------------------------------------------------------
   %  Use GAUSS-NEWTON method on least squares problem.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_13 as least squares problem: \n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt13_rj';
   options = [];
   options.verbose            = 0;
   options.method             = 'gauss_newton';
   options.step_tolerance     = 1.e-15;
   options.globalization      = 'none';
   options.gradient_tolerance = 1.e-10;
   options.max_iterations     = 10000;
   options.max_fevals         = 10000;

   x0 = [ 1; 1 ];
   x = entrust(fname, x0, options);
   fprintf('Gauss-Newton produced  (%10.7e, %10.7e)\n\n',x(1),x(2))
   [ res, jac ] = opt13_rj ( x, 'f' );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );
