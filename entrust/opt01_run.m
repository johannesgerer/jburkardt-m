%% OPT01_RUN
%
%  Modified:
%
%    09 January 2008
%
   %---------------------------------------------------------------------
   %  Running the first testcase, from D+S, pp. 100, 202; x_* = [2;-1].
   %  This should finish in 10 iterations for Newton's method and in
   %  12 iterations for BFGS.
   %---------------------------------------------------------------------

   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_1:  exact solution (2,-1)\n')
   fprintf('---------------------------------------------------------\n')

   fname = 'opt01_fgh';

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
   f = opt01_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );
%
%  Run with secant method.
% 
   fprintf('Secant method:\n')
   options.method             = 'secant';
   options.initial_hessian    = [ 14., -4. ; -4.  4. ];
   x = entrust(fname, x0, options);
   fprintf('BFGS   method produced (%10.7e,%10.7e)\n\n',x(1),x(2))
   f = opt01_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );
   %---------------------------------------------------------------------
   %  Test Gauss-Newton strategies.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_1 as least squares problem: \n')
   fprintf('Exact solution (2,-1)\n')
   fprintf('---------------------------------------------------------\n')

   fname = 'opt01_rj';
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
   [ res, jac ] = opt01_rj ( x, 'f' );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );
