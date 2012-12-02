%% OPT05_RUN
%
%  Modified:
%
%    09 January 2008
%
   %---------------------------------------------------------------------
   %  Running testcase, from D+S, pp. 157-8; x_* = [.1,10].
   %  This tests the scaling implementation.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_5 as scalar optimization problem:\n' );
   fprintf('Exact solution (0.1, 10)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt05_fgh';
   options = [];
   options.verbose            = 0;
   options.method             = 'newton';
   options.globalization      = 'trust_region';
   options.step_tolerance     = 1.e-14;
   options.gradient_tolerance = 1.e-14;
   options.max_fevals         = 151;
   options.max_iterations     = 151;

   alpha = 10;
   fprintf ( 'Program scale ALPHA = %f\n', alpha );
   x0 = [-1.2/alpha, alpha];   
   fprintf('Unscaled:\n')
%
% should require ~94 iterations
%
   x = entrust(fname, x0, options, alpha);

   fprintf('Newton produced  (%10.7e, %10.7e)\n\n',x(1),x(2))
   f = opt05_fgh ( x, 'f', alpha );
   fprintf('Value of F(X) = %f\n', f );

   options.scale_x            = [ 1/alpha; alpha ];
   fprintf('Scaled:\n')

   % should require ~24 iterations
   x = entrust(fname, x0, options, alpha);

   fprintf('Newton produced  (%10.7e, %10.7e)\n\n',x(1),x(2))
   f = opt05_fgh ( x, 'f', alpha );
   fprintf('Value of F(X) = %f\n', f );

   %---------------------------------------------------------------------
   %  Test Gauss-Newton strategies.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_5 as least squares problem: \n')
   fprintf('Exact solution (0.1, 10)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt05_rj';
   options = [];
   options.verbose            = 0;
   options.method             = 'gauss_newton';
   options.step_tolerance     = 1.e-15;
   options.globalization      = 'none';
   options.gradient_tolerance = 1.e-10;
   options.max_iterations     = 40;

   alpha = 10;
   fprintf ( 'Program scale ALPHA = %f\n', alpha );
   x0 = [-1.2/alpha, alpha];   
   fprintf('Unscaled:\n')

   x = entrust(fname, x0, options, alpha);

   fprintf('Gauss-Newton produced  (%10.7e, %10.7e)\n\n',x(1),x(2))
   [ res, jac ] = opt05_rj ( x, 'f', alpha );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );

   options.scale_x            = [ 1/alpha; alpha ];
   fprintf('Scaled:\n')

   x = entrust(fname, x0, options, alpha);

   fprintf('Gauss-Newton produced  (%10.7e, %10.7e)\n\n',x(1),x(2))
   [ res, jac ] = opt05_rj ( x, 'f', alpha );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );
