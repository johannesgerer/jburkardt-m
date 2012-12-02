%% OPT04_RUN
%
%  Modified:
%
%    26 January 2008
%
   %---------------------------------------------------------------------
   %  Running the Himmelblau function.
   %---------------------------------------------------------------------

   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_4:  Himmelblau\n')
   fprintf('---------------------------------------------------------\n')

   fname = 'opt04_fgh';

   options = [];
   options.verbose            = 0;
   options.step_tolerance     = 1.e-11;
   options.gradient_tolerance = 1.e-11;
   options.max_iterations     = 15;

   x0 = [ 1; 1];
%
%  Run with Newton method.
%   
   fprintf('Newton method:\n')
   options.method             = 'newton';
   options.globalization      = 'none';

   x = entrust(fname, x0, options);

   fprintf('Newton method produced (%10.7e,%10.7e)\n\n',x(1),x(2))
   f = opt04_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );
%
%  Run with secant method.
% 
   fprintf ( '\n' );
   fprintf ( 'Use the secant method:\n')
   fprintf ( '  (Algorithm likely to fail!)\n' );
   fprintf ( '\n' );

   options.method             = 'secant';
   options.initial_hessian    = [ 0., 1. ; 1.,  0. ];
   x = entrust(fname, x0, options);
   fprintf('BFGS   method produced (%10.7e,%10.7e)\n\n',x(1),x(2))
   f = opt04_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );
   %---------------------------------------------------------------------
   %  Test Gauss-Newton strategies.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_4 as least squares problem: \n')
   fprintf('---------------------------------------------------------\n')

   fname = 'opt04_rj';
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
   [ res, jac ] = opt04_rj ( x, 'f' );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );
